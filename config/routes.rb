Rails.application.routes.draw do
  resources :animal_types
  resources :text_messages
  resources :users
  resources :teachers
  resources :student_grades
  resources :students
  resources :class_of_students
  resources :presences
  resources :tests
  resources :courses
  resources :lessons
  resources :classrooms
  resources :animals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
