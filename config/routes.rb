Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :users, :except => [:new , :edit]
      post 'users/:id/join', to: 'users#join'
      post 'users/:id/leave', to: 'users#leave'
      resources :organizations, :except => [:new , :edit]
    end  
  end  
end
