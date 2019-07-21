require 'rails_helper'

RSpec.describe WeightLog, type: :model do
  describe 'validations' do
    it { should validate_presence_of :weight }
  end

  describe 'relationships' do
    it { should belong_to :client }
  end
end
