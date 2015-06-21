Rails.application.routes.draw do

  ## landing page and home page when signed in
  root 'pages#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create', as: 'create_session'
  ## logout of session
  delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/signup' => 'users#new'

  resources :users, only: [:create]
  resources :surveys
  resources :submissions, only: [:create, :show]

  ## show survey data to owner - must authenticate owner identity
  get 'surveys/:id/owner_display' => 'surveys#owner_display', as: 'survey_display'

end
