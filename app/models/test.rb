class Test < ApplicationRecord
  has_many :lessons
  has_many :student_grades
end
