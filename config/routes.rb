Rails.application.routes.draw do
  
  
  devise_for :admin, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  mount RailsAdmin::Engine => '/admins', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'index' => 'pages#index'
  get 'RocketElevatorsWebpage_Residential.html' => 'pages#RocketElevatorsWebpage_Residential.html'
  get 'RocketElevatorsWebpage_Corporate.html' => 'pages#RocketElevatorsWebpage_Corporate.html'
  get 'RocketElevatorsWebpage_submission.html' => 'pages#RocketElevatorsWebpage_submission.html'
  get 'login.html' => 'pages#login.html'
  get 'employee' => 'pages#admin/login'
  get "quotes" => "pages#index"
  get "/charts" => 'charts#charts'
  get "google_map" => 'google_maps#index'
  get "/watson" => 'watson#watson'

  resources :google_maps
  resources :quotes
  resources :leads
  

end
