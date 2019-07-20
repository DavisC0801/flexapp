require 'rails_helper'

RSpec.describe Trainer, type: :model do
  describe "relationships" do
    it {should have_many :clients}
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :password }
    it { should validate_presence_of :phone_num }
  end

end
