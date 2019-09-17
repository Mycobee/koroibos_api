require 'rails_helper'

RSpec.describe OlympianEvent, type: :model do
  describe 'relationships' do
    it { should belong_to(:event) }
    it { should belong_to(:olympian) }
  end

  describe 'validations' do
    it { should validate_presence_of(:medal) }
  end
end
