Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount_ember_app :frontend, to: "/"

  get '/boards/:id' , to: "boards#delete" #khodesh mire new ham mikone
  get '/boards/:id' , to: "boards#create"
  get '/boards/statistics' , to: "boards#statistics"
  patch '/boards/:id' , to: "boards#update"
  #get '/game/list' , to


  ##parse yaml
  ##authentication
  
end
