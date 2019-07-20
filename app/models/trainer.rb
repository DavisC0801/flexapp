class Trainer < ApplicationRecord
  has_many :clients

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name, :last_name, :password
  has_secure_password
end
