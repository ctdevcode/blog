Rails.application.routes.draw do
  root 'pages#index'
	resources :posts
	get 'timeline', to: 'posts#timeline'
end
