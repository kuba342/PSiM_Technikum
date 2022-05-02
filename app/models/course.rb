class Course < ApplicationRecord
  has_many :student_grades
  has_many :lessons
end
