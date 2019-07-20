class Client < ApplicationRecord
  belongs_to :trainer

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name, :last_name, :password, :phone_num
  has_secure_password
end
