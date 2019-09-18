require 'rails_helper'

describe "medalists api" do
	before :each do
      olympian_1_attrs = {
        name: "Bob Ross",
        sex: "M",
        age: 42,
        height: 190,
        weight: 150,
        team: 'USA'
      }
	    @sport_1 = Sport.create!(name: 'Code Lifting')
      @olympian_1 = @sport_1.olympians.create!(olympian_1_attrs)

      olympian_2_attrs = {
        name: "Prince",
        sex: "M",
        age: 22,
        height: 160,
        weight: 50,
        team: 'USA'
      }
      sport_2 = Sport.create!(name: 'competitive dancing')
      @olympian_2 = sport_2.olympians.create!(olympian_2_attrs)

      olympian_3_attrs = {
        name: "Garth Brooks",
        sex: "F",
        age: 12,
        height: 120,
        weight: 100,
        team: 'Russia'
      }
      
      sport_3 = Sport.create!(name: 'competitive yodling')
      @olympian_3 = sport_3.olympians.create!(olympian_3_attrs)

      event_1a_attrs = {
        name: "bird draw",
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

      @event_1a = @sport_1.events.create!(event_1a_attrs)

      olympian_event_1a = @olympian_1.olympian_events.new(olympian_event_1a_attrs)
      olympian_event_1a.event = @event_1a
      olympian_event_1a.save
      
      olympian_event_1b = @olympian_2.olympian_events.new(olympian_event_1b_attrs)
      olympian_event_1b.event = @event_1a
      olympian_event_1b.save
      
      olympian_event_1c = @olympian_3.olympian_events.new(olympian_event_1c_attrs)
      olympian_event_1c.event = @event_1a
      olympian_event_1c.save
	end
	
	it "returns the event name and an array of medalist" do
    get "/api/v1/events/#{@event_1a.id}/medalists"

    expect(response).to be_successful

    medalist_data = JSON.parse(response.body)

    expect(medalist_data["event"]).to eq(@event_1a.name)
    expect(medalist_data["medalists"][0]["name"]).to eq(@olympian_2.name)
	end

  it "returns 404 if the event is not found" do
    get "/api/v1/events/256000/medalists"

    expect(response.status).to eq(404)
  end
end

