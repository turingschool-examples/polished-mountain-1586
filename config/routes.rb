Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/scientists/:id", to: "scientists#show", as: :scientist
  delete "/scientists/:id", to: "scientists#destroy", as: :remove_experiment

  get "/experiments", to: "experiments#index", as: :experiments

  get "/labs/:id", to: "labs#show", as: :lab
end
