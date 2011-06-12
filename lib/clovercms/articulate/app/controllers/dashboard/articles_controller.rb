class Dashboard::ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_article, :only => [ :edit, :update, :destroy ]

  access_control do
    allow :admin
    allow :editor,  :to => [ :new, :create, :index ]
    allow :owner,   :of => :article, :to => [ :edit, :update, :destroy ]
  end

  def index
    @articles = Article.page params[:page]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new params[:article]

    if @article.save
      flash[:success] = t 'messages.notifications.success'
      current_user.has_role! :owner, @article
      redirect_to edit_dashboard_article_path(@article)
    else
      render :new
    end
  end

  def update
    if @article.update_attributes( params[:article] )
      flash[:success] = t 'messages.notifications.success'
      redirect_to edit_dashboard_article_path( @article )
    else
      render :edit
    end
  end

  def destroy
    if @article.delete
      flash[:success] = t 'messages.notifications.success'
    else
      flash[:error]   = t 'messages.notifications.error'
    end

    redirect_to dashboard_articles_path
  end

  private
  def set_article
    @article = Article.find params[:id]
  end
end
