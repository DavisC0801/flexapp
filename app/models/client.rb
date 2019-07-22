class Client < ApplicationRecord
  belongs_to :trainer, required: false
  has_many :weight_logs

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name, :last_name, :password
  has_secure_password
end
