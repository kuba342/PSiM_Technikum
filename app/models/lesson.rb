class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :class_of_student
  belongs_to :animal
  belongs_to :test
  belongs_to :classroom
  belongs_to :course
  has_many :presences
  def lesson_infor
    "#{course.name} - #{date}"
  end
end
