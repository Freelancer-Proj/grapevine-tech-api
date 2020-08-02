Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :blogs, only: [:index, :show]
      resources :staffs, only: [:index, :show]
      resources :reviews, only: [:index, :show]
      resources :contact_us, only: [:index, :show, :create]
      resources :statistics, only: [:index, :show]
      resources :speeches, only: [:index, :show]
      resources :portfolios, only: [:index, :show]
    end
  end
end
