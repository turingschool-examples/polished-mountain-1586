Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :scientists, only: [:show]
    resources :experiments, only: [:destroy], controller: 'scientist_experiments', as: 'scientist_experiment'
  
    # delete "/scientists/:id", to: "scientist_experiments#destroy", as: 'scientist_experiment'
  
  resources :experiments, only: [:index]
end
