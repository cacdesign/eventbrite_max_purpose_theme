Rails.application.routes.draw do
 

  get 'event_submissions/index'
  get 'event_submissions/show'
  get 'event_submissions/edit'
  get 'event_submissions/update'
  get 'admins/index'
  get 'secrets/show'
  get 'illustrations/create'
  get 'avatars/create'
  devise_for :users
  root 'events#index'

  resources :events do
  	resources :attendances
  	resources :illustrations, only: [:create]
  end

  resources :secrets
  resources :users do
  resources :avatars, only: [:create]

end
  resources :charges
  resources :admins, only: [:index]
	resources :event_submissions

end
