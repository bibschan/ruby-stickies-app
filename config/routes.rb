Rails.application.routes.draw do
  # to find out what routes your application has, use the rake routs command

  #ORIGINAL get 'posts/index'

  #CHANGED TO 
  resources :posts

  #this will add the CRUD actions and routes to your view


  #this makes the index page the initial "root" that's displayed
  root 'posts#index'

end
