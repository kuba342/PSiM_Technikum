class Test < ApplicationRecord
  has_many :lessons
  has_many :student_grades
  def test_infor
    "#{name} - #{description}"
  end
end
