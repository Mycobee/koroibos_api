require 'rails_helper'

describe "olympians api" do
	before :each do
      olympian_1_attrs = {
        name: "Bob Ross",
        sex: "M",
        age: 22,
        height: 190,
        weight: 140,
        team: 'USA'
      }
      sport_1 = Sport.create!(name: 'competitive painting')
      @olympian_1 = sport_1.olympians.create!(olympian_1_attrs)

      olympian_2_attrs = {
        name: "Prince",
        sex: "M",
        age: 42,
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
	end
	
	it "sends a list of olympians" do
    get '/api/v1/olympians'

    expect(response).to be_successful
    olympian_data = JSON.parse(response.body)

    expect(olympian_data["olympians"][0]["name"]).to eq(@olympian_1.name)
    expect(olympian_data["olympians"][2]["sport"]).to eq(@olympian_3.sport.name)
	end
end

