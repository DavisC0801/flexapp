require "rails_helper"

RSpec.describe MealPlan, type: :model do
  describe 'relationships' do
    it { should belong_to :client }
  end

  describe 'validations' do
    it { should validate_presence_of :calories }
    it { should validate_presence_of :diet_type }
  end
end
