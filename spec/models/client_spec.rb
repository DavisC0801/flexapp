require 'rails_helper'

RSpec.describe Client, type: :model do
  describe "relationships" do
    it {should belong_to :trainer}
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :password }
  end

end
