class User < ApplicationRecord
  has_many :students
  has_many :teachers
  validates :login, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :password, presence: true, length: { in: 7..50 }
  validates :email, presence: true, uniqueness: true, length: { in: 3..50 }
  has_secure_password
  has_secure_token
  def invalidate_token
    self.update_columns(token: nil)
  end
end
