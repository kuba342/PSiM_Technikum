class Animal < ApplicationRecord
  belongs_to :animal_type
  has_many :lessons
  def animal_infor
    "#{animal_type.species} #{code}"
  end
end
