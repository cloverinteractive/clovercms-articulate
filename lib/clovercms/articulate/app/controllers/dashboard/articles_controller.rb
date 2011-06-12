class Dashboard::ArticlesController < ApplicationController
  access_control do
    allow :admin
    allow :editor
    allow :owner, :of => :article, :to => [ :edit, :update, :destroy ]
  end

  def index
    @articles = Article.page params[:page]
  end
end
