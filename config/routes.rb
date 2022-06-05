Rails.application.routes.draw do
  root to: 'static#index'

  get     '/feed',    to: 'static#feed'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  get     '/logout',  to: 'sessions#destroy'

  resources :presences
  resources :lessons
  resources :student_grades
  resources :courses
  resources :students
  resources :class_of_students
  resources :teachers
  resources :tests
  resources :users
  resources :classrooms
  resources :animals
  resources :animal_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
