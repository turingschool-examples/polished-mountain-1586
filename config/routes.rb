Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get "/scientists", to: "scientists#all"
  get "/scientists/:id", to: "scientists#show"

end
