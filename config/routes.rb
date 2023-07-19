Rails.application.routes.draw do
  get 'search_results', to: "search#index"

  devise_for :users
 # root to: "challenges#index"

 # added landing page for the web app
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories, only: %i[index show]
  # challenges routues to show on index and show page

  resources :challenges, only: %i[index show]

  resources :challenges do
    resources :habits, only: %i[index create]
  end


  # to be finished

  resources :events

  get 'dashboard', to: "dashboards#index"

  get 'community', to: "communities#index"

  # create a route for the event completion post maybe ?
  get "event_completed", to: "habits#event_completed", as: :event_completed
  get "event_deleted", to: "habits#event_deleted", as: :event_deleted
end
