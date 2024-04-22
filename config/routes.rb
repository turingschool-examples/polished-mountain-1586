Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :scientists, only: [:show] do
    resources :scientist_experiments, only: [:destroy], as: "scientist_experiments"
  end
    # "/scientists/:scientist_id/experiments/:id", to: "scientist_experiments#destroy", as: 'scientist_experiment'
  
  resources :experiments, only: [:index]
end
