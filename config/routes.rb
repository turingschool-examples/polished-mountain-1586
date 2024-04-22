Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :scientists, only: [:show] do
    resources :experiments, controller: "experiment_scientists", only: [:destroy]
  end

  resources :experiments, only: [:index]
end
