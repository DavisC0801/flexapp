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

  def recent_weights(limit)
    weight_logs.limit(limit)
  end

  def progress
    p = (79.to_f/100)
    p = (p * 100).round
  end
end
