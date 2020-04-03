Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Mechanics
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mechanic_id', to: 'mechanics#show'
  patch '/mechanics/:mechanic_id', to: 'mechanics#update'
  #Parks
  get '/amusement_parks/:amusement_park_id', to: 'amusement_parks#show'
end
