Rails.application.routes.draw do
	#
	# get 'sessions/new'
	#
	# get 'sessions/create'
	#
	# get 'sessions/destroy'
	resource :sessions

	get 'users/new' => 'users#new'

	get 'users/create' => 'users#create'

	get 'new/create'=> 'new#create'

root 'pictures#index'

get 'pictures' => 'pictures#index'

post 'pictures' => 'pictures#create'
get 'pictures/new' => 'pictures#new'

get 'pictures/:id' => 'pictures#show'

get 'pictures/:id/edit' => "pictures#edit"
patch 'pictures/:id' => "pictures#update"

delete 'pictures/:id' => 'pictures#destroy'
end
