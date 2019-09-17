require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'relationships' do
    it { should have_many(:events) }
    it { should have_many(:olympians) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end
end
