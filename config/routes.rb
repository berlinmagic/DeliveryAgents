Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  # => devise_scope :user do
  # =>   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # => end
  
  get 'auth/:provider/callback', to: 'sessions#provider'
  get 'auth/failure', to: redirect('/')
  
  root to: "front#start"
  
end
