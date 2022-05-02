Rails.application.routes.draw do
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
