Rails.application.routes.draw do
#  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homepage#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/jobs' => 'jobs#create'
  get '/jobs' => 'jobs#index'
  get '/jobsid' => 'jobs#show'
  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'  
end

