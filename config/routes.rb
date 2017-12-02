Rails.application.routes.draw do
 
  root :to => 'public#index'

  get 'show/:permalink', :to => 'public#show', :as => 'public_show'
  
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  
  resources :admin_users, :except => [:show] do 
    member do
      get :delete
    end
  end
  
  resources :subjects do [:new]
    member do
      get :delete
    end
  end
  
  resources :pages do [:new]
    member do
      get :delete
    end
  end
  
  resources :sections do [:new]
    member do
      get :delete
    end
  end
  
  get 'portfolio/index'
  get 'portfolio/show'
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/niyi'
  get 'demo/escape_output'
  #default route might be deprecated
  #get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
