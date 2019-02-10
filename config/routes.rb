EcomApi::Application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json },path: '/' do
    scope module: :v1 do
      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy]
    end
  end  

end
