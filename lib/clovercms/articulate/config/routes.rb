Rails.application.routes.draw do
  namespace :dashboard do
    resources :articles, :only => [ :index, :edit, :new, :update, :create, :destroy ]
  end

  resources :articles, :only => :show
end
