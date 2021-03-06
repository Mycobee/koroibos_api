require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should belong_to(:sport) }
    it { should have_many(:olympian_events) }
    it { should have_many(:olympians).through(:olympian_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:games) }
  end
end
