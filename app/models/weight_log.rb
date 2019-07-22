class WeightLog < ApplicationRecord
  validates_presence_of :weight

  belongs_to :client

  def self.latest
    order(created_at: :desc).take
  end
end
