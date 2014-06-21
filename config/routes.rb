Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # => devise_scope :user do
  # =>   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # => end

  root to: "front#start"

  namespace :api, defaults: { format: :json } do
    resource :sessions, only: :create
    resources :jobs, only: :index
  end
end
