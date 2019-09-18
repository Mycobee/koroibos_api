require 'rails_helper'

describe "events API" do
		before :each do
	    @sport_1 = Sport.create!(name: 'Code Lifting')
	    @sport_2 = Sport.create!(name: 'Dog Petting')

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
    
      event_2a_attrs = {
        name: "Sing songs",
        games: "2020 couch party",
      } 
      
      event_2b_attrs = {
        name: "Dance dances",
        games: "2020 couch party",
      } 
      
      event_2c_attrs = {
        name: "Code codes",
        games: "2020 couch party",
      } 

      @event_1a = @sport_1.events.create!(event_1a_attrs)
      @event_1b = @sport_1.events.create!(event_1b_attrs)
      @event_1c = @sport_1.events.create!(event_1c_attrs)

      @event_2a = @sport_2.events.create!(event_2a_attrs)
      @event_2b = @sport_2.events.create!(event_2b_attrs)
      @event_2c = @sport_2.events.create!(event_2c_attrs)
		end
		
		it "returns an array of all events grouped by sport" do
      get '/api/v1/events'

      expect(response).to be_successful

      events_data = JSON.parse(response.body)

      expect(events_data["events"][0]["sport"]).to eq(@sport_1.name)
		end
end

