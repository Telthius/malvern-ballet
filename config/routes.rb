Rails.application.routes.draw do
  resources :enrolments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  get 'home', to: 'home#index'

  namespace :admin do
    resources :timetables do
      resources :ballet_classes do 
        resources :class_times, except: [:index, :show]
      end
    end
  end

  get 'bootybarre', to: 'bootybarre#index'

  resources 'enrolments'

  resources 'timetables', only: [:index, :show]

  resources 'ballet_levels', only: [:index, :show], path: 'ballet_classes'
end
