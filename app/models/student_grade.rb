class StudentGrade < ApplicationRecord
  has_many :student
  has_many :course
  has_many :test
  has_many :teacher
end
