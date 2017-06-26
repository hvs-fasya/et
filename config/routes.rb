Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'home#index'

	resources :users
	get '/user', to: "users#show"
	get '/user/edit', to: "users#edit"
	patch '/user/update', to: "users#update"
	delete '/user/delete', to: "users#destroy"

	resources :persons

	# get '/person', to: "persons#show"
	# get '/person/edit', to: "persons#edit"
	get '/person_list/clear', to: "persons#clear"
	get '/person_list/seed', to: "persons#seed_faked"
	# patch '/person/update', to: "persons#update"
	# delete '/person/delete', to: "persons#destroy"


	# post '/persons/save', to: "persons#write_to_session"
end
