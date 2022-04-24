class Presence < ApplicationRecord
  has_many :lessons
  has_many :students
end
