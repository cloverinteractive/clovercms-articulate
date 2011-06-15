require 'test_helper'

class Dashboard::ArticlesControllerTest < ActionController::TestCase
  def setup
    assert @user = User.create( :username => 'john.doe' )
    assert @controller.class.any_instance.stubs( :current_user ).returns( @user )
    assert @new_title = 'this is my new title'
  end

  test "admin can get to the index" do
    assert @user.has_role! :admin

    get :index
    assert_response :success
    assert assigns( :articles )
    assert assigns( :articles ).blank?
  end

  test "editor can get to the index" do
    assert @user.has_role! :editor

    get :index
    assert_response :success
    assert assigns( :articles )
  end

  test "invalid role can't get to index" do
    get :index
    assert_response 403
  end

  test "can create articles" do
    [ :admin, :editor ].each do |role|
      assert @user.has_role! role
      assert_difference 'Article.count' do
        post :create, :article => Factory.attributes_for( :article )
        assert assigns( :article )
        assert_redirected_to edit_dashboard_article_path( assigns( :article ) )
      end
      assert @user.has_no_role!( role )
    end

    assert_equal 2, @user.articles.count
  end

  test "creating an article makes me its owner" do
    assert @user.has_role! :admin
    assert_difference 'Article.count' do
      post :create, :article => Factory.attributes_for( :article )
      assert assigns( :article )
      assert_redirected_to edit_dashboard_article_path( assigns( :article ) )
      assert @user.has_role?( :owner, assigns( :article ) )
    end
  end

  test "admin can destroy articles" do
    assert article = Factory.create( :article )
    assert @user.has_role! :admin

    assert_difference 'Article.count', -1 do
      delete :destroy, :id => article.id
    end
  end

  test "admin can update article" do
    assert article = Factory.create( :article )
    assert @user.has_role! :admin
    put :update, :id => article.id, :article => Factory.attributes_for( :article, :title => @new_title )
    assert_equal @new_title, article.reload.title
  end

  test "as an owner I can destroy my article" do
    assert article = Factory.create( :article )
    assert @user.has_role!( :owner, article )

    assert_difference 'Article.count', -1 do
      delete :destroy, :id => article.id
    end
  end

  test "as an owner I can update my article" do
    assert article = Factory.create( :article )
    assert @user.has_role!( :owner, article )
    put :update, :id => article.id, :article => Factory.attributes_for( :article, :title => @new_title )
    assert assigns( :article )
    assert_redirected_to edit_dashboard_article_path( assigns(:article) )
    assert_equal @new_title, article.reload.title
  end
end
