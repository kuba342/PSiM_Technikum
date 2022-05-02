class Student < ApplicationRecord
  belongs_to :user
  belongs_to :class_of_student
  has_many :presences
  has_many :student_grades
end
