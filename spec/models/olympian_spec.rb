require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'relationships' do
    it { should belong_to(:sport) }
    it { should have_many(:olympian_events) }
    it { should have_many(:events).through(:olympian_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sex) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:team) }
    it { should validate_presence_of(:total_medals_won) }
  end

  describe 'instance methods' do
    before :each do
      olympian_1_attrs = {
        name: "Bob Ross",
        sex: "M",
        age: 22,
        height: 190,
        weight: 140,
        team: 'USA'
      }

      event_1a_attrs = {
        name: "bird draw",
        games: "2020 couch party",
      } 

      event_1b_attrs = {
        name: "cloud draw",
        games: "2020 couch party",
      } 

      event_1c_attrs = {
        name: "star draw",
        games: "2020 couch party",
      } 

      olympian_event_1a_attrs = {
        medal: "NA"
      }
      olympian_event_1b_attrs = {
        medal: "Gold"
      }
      olympian_event_1c_attrs = {
        medal: "Bronze"
      }

      sport = Sport.create!(name: 'competitive painting')
      @olympian_1 = sport.olympians.create!(olympian_1_attrs)

      event_1a = sport.events.create!(event_1a_attrs)
      event_1b = sport.events.create!(event_1b_attrs)
      event_1c = sport.events.create!(event_1c_attrs)

      olympian_event_1a = @olympian_1.olympian_events.new(olympian_event_1a_attrs)
      olympian_event_1a.event = event_1a
      olympian_event_1a.save

      olympian_event_1b = @olympian_1.olympian_events.new(olympian_event_1b_attrs)
      olympian_event_1b.event = event_1b
      olympian_event_1b.save

      olympian_event_1c = @olympian_1.olympian_events.new(olympian_event_1c_attrs)
      olympian_event_1c.event = event_1c
      olympian_event_1c.save
    end

    it '#medal_count' do
      expect(@olympian_1.medal_count).to eq(2)
    end
  end
end
