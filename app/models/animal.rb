class Animal < ApplicationRecord
  belongs_to :animal_type
  has_many :lessons
end
