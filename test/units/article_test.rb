require 'test_helper'

class ArticuleTest < ActiveSupport::TestCase
  test "must have title" do
    assert article = Factory.build( :article, :title => nil )
    assert article.invalid?
  end

  test "must contain body" do
    assert article = Factory.build( :article, :body => nil )
    assert article.invalid?
  end

  test "body's length must be at least 50 chars" do
    assert article = Factory.build( :article, :body => ( 'a' * 49 ) )
    assert article.invalid?

    assert article.body = ('a' * 50 )
    assert article.valid?
  end

  test "publish date must be present" do
    assert article = Factory.build( :article, :publish_date => nil )
    assert article.invalid?
  end

  test "can create article" do
    assert_difference 'Article.count' do
      assert Factory.create( :article )
    end
  end

  test 'can remove article' do
    assert article = Factory.create( :article )
    assert_difference 'Article.count', -1 do
      assert article.delete
    end
  end

  test 'can update article' do
    assert article    = Factory.create( :article )
    assert old_title  = article.title
    assert article.update_attributes!( :title => 'totally different' )
    assert_not_equal old_title, article.title
  end

  test 'article has title in url' do
    assert article = Factory.create( :article )
    assert_match /#{article.title.parameterize}\Z/, article.to_param
  end

  test 'can delete article' do
    assert article = Factory.create( :article )

    assert_difference 'Article.count', -1 do
      article.delete
    end
  end
end
