EcomApi::Application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json },path: '/' do
    scope module: :v1 do
    
      resources :users, :only => [:show, :create, :update, :destroy] do
        # this is the line
        resources :products, :only => [:create, :update]
      end
      resources :sessions, :only => [:create, :destroy]
      resources :products, :only => [:show, :index] 
    end
  end  

end
