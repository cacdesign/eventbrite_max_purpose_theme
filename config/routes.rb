Rails.application.routes.draw do
 

  get 'illustrations/create'
  get 'avatars/create'
  devise_for :users
  root 'events#index'

  resources :events do
  	resources :attendances
  	resources :illustrations, only: [:create]
  end


  resources :users do
  resources :avatars, only: [:create]
end
  resources :charges

end
