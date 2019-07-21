class WeightLog < ApplicationRecord
  validates_presence_of :weight

  belongs_to :client
end
