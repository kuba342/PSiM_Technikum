class ClassOfStudent < ApplicationRecord
  belongs_to :teacher
  has_many :lessons
  has_many :students
end
