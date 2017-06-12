Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'home#index'

	resources :users
	get '/user', to: "users#show"
	get '/user/edit', to: "users#edit"
	patch '/user/update', to: "users#update"
	delete '/user/delete', to: "users#destroy"
end
