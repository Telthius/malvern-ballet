Rails.application.routes.draw do
  devise_for :administrators, skip: [:registrations]
  resources :enrolments, except: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  get 'home', to: 'home#index'

  # Development-only design system
  if Rails.env.development?
    get 'design-system', to: 'design_system#index', as: :design_system
  end

  namespace :admin do
    resources :timetables do
      resources :ballet_classes do 
        resources :class_times, except: [:index, :show]
      end
    end
    
    resources :ballet_levels do
      resources :costs, except: [:index, :show]
    end
  end



  resources 'enrolments', except: [:index]

  resources 'timetables', only: [:index, :show]

  resources 'ballet_levels', only: [:index, :show], path: 'ballet_classes'

  # Sitemap
  get 'sitemap.xml', to: 'sitemap#index', format: 'xml', as: :sitemap
end
