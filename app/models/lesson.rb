class Lesson < ApplicationRecord
  has_many :animals
  has_many :classrooms
  has_many :class_of_students
  has_many :teachers
end
