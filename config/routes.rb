Rails.application.routes.draw do
  resources :quiz_answers
  resources :quiz_questions
  resources :quizzes
  resources :words
  resources :topics
  resources :courses
  resources :categories
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root to: 'static_pages#home'
  match '/signup',       to: 'users#new',            via: 'get'
  match '/signin',       to: 'sessions#new',         via: 'get'
  match '/signout',      to: 'sessions#destroy',     via: 'delete'
  match '/help',         to: 'static_pages#help',    via: 'get'
  match '/about',        to: 'static_pages#about',   via: 'get'
  match '/contact',      to: 'static_pages#contact', via: 'get'
  match '/user/courses', to: 'users#courses',        via: 'get'
end
