class Client < ApplicationRecord
  belongs_to :trainer, required: false
  has_many :weight_logs
  has_many :meal_logs
  has_one :meal_plan, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name, :last_name, :password
  has_secure_password

  def recent_meals(limit)
    meal_logs.limit(limit)
  end
end
