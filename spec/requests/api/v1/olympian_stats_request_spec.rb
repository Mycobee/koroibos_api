require 'rails_helper'

describe "olympian stats api" do
	before :each do
	  ##olympian_data
    olympian_1_attrs = {
      name: "Bob Ross",
      sex: "M",
      age: 42,
      height: 190,
      weight: 140,
      team: 'USA'
    }
    sport = Sport.create!(name: 'competitive painting')
    @olympian_1 = sport.olympians.create!(olympian_1_attrs)
    
    olympian_2_attrs = {
      name: "Prince",
      sex: "M",
      age: 22,
      height: 160,
      weight: 110,
      team: 'USA'
    }
    sport_2 = Sport.create!(name: 'competitive dancing')
    @olympian_2 = sport_2.olympians.create!(olympian_2_attrs)

    olympian_3_attrs = {
      name: "Garth Brooks",
      sex: "F",
      age: 12,
      height: 120,
      weight: 190,
      team: 'Russia'
    }
    
    sport_3 = Sport.create!(name: 'competitive yodling')
    @olympian_3 = sport_3.olympians.create!(olympian_3_attrs)

    ##Event data
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
	
	it "returns a list of olympian statistics" do
	  get '/api/v1/olympian_stats'	

    expect(response).to be_successful

    stat_data = JSON.parse(response.body)
    expect(stat_data["olympian_stats"]["total_competing_olympians"]).to eq(3)
	end
end

