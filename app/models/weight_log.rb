class WeightLog < ApplicationRecord
  validates_presence_of :weight

  belongs_to :client

  default_scope { order(created_at: :desc) }

  def self.latest
    order(created_at: :desc).take
  end
end
