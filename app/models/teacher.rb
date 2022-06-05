class Teacher < ApplicationRecord
  belongs_to :user
  has_many :class_of_students
  has_many :lessons
  has_many :student_grades
  def name
    "#{lastName} #{firstName}"
  end
end
