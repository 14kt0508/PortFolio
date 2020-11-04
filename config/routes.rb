Rails.application.routes.draw do

	root :to => 'top#top'
    get '/about' => 'top#about'

    devise_for :admins, controllers: {
		sessions: 'admins/sessions',
		registrations: 'admins/registrations',
		passwords: 'admins/passwords'
		}
	# resources :admins

	devise_for :users, controllers: {
	    sessions: 'users/sessions',
	    registrations: 'users/registrations',
	    passwords: 'users/passwords'
		}
	# resources :users



	namespace :admins do
		resources :admins, only: [:show, :edit, :update, :destroy]
		resources :children, only: [:index]
		resources :users, only: [:index, :show,]
		resources :calendars, only: [:index,]
		resources :events, only: [:new, :create, :show, :edit, :update, :destroy]
		resources :contacts, only: [:index, :new, :create, :show] do
    		collection do
      			post 'confirm'
    		end
    	end
	end



	scope module: :users do
		resources :users, only: [:show, :edit, :update, :destroy]
		get 'users/complete'
		resources :children, only: [:new, :create, :edit, :update, :destroy]
		resources :pick_up_persons, only: [:new, :create, :edit, :update, :destroy]
		resources :calendars, only: [:index]
		resources :events, only: [:index, :show]
		resources :contacts, only: [:index, :show]
	end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
