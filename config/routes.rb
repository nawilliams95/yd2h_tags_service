Rails.application.routes.draw do
  root 'welcome#index'
  resources :tags do 
    collection do
      get '/:name', to: 'tags#nameindex'
      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
