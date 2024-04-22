Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources(
    :scientists,
    only: %i[show]
  )

  resources(
    :scientist_experiments,
    only: %i[destroy]
  )

  resources(
    :experiments,
    only: %i[index]
  )

  resources(
    :labs,
    only: %i[show]
  )
end
