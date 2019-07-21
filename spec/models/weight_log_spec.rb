require 'rails_helper'

RSpec.describe WeightLog, type: :model do
  describe 'validations' do
    it { should validate_presence_of :weight }
  end

  describe 'relationships' do
    it { should belong_to :client }
  end

  describe 'class methods' do

    it ".latest" do
      client = create(:client)
      log1 = client.weight_logs.create(weight: 123, created_at: Date.today - 8)

      expect(client.weight_logs.latest).to eq(log1)

      log2 = client.weight_logs.create(weight: 123)

      expect(client.weight_logs.latest).to eq(log2)
    end
  end

end
