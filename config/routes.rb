Rails.application.routes.draw do

  # get 'users/show'
	devise_for :users
	root 'home#index'
	resources :books
	get "home/about", to: "home#about"

	resources :users, only: [:show, :edit, :update, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end