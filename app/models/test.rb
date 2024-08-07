class Test < ApplicationRecord
  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 30 }
  validates :age, numericality: { only_integer: true, greater_than: 18 }
  validates :contact_number, presence: true, length: { maximum: 13 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :password, presence: true, length: { maximum: 64 }
end
