Rails.application.routes.draw do
  
  root 'demo#index'
  
  resources :subjects do [:new]
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
  #default route might be deprecated
  #get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
