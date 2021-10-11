Rails.application.routes.draw do
  resources :teams
  get '/dashboard' => 'dashboard#index', as: :dashboard
  get 'events/:id/students', to: 'events#show_students', as: 'show_students'
  resources :students do
    member do
      patch :visit_update
    end
  end
  resources :events do
    member do
      patch :activation
      patch :get_preview
    end
  end
  devise_for :accounts
  root to: 'public#main'
  get '/students', to: redirect('/public')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
