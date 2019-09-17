require 'csv'

namespace :import do
  task :data => :environment do
    CSV.foreach('./data/olympic_data_2016.csv', headers: true) do |row|
      name = row.to_h["Name"]
      sex = row.to_h["Sex"]
      age = row.to_h["Age"]
      height = row.to_h["Height"]
      weight = row.to_h["Weight"]
      team = row.to_h["Team"]
      games = row.to_h["Games"]
      sport = row.to_h["Sport"]
      event_name = row.to_h["Event"]
      medal = row.to_h["Medal"]

      row_sport = Sport.find_or_create_by(name: sport)

      row_olympian = Olympian.find_or_create_by(name: name) do |olympian|
        olympian.sex = sex
        olympian.age = age
        olympian.height = height
        olympian.weight = weight
        olympian.team = team
        olympian.sport = row_sport 
      end

      row_event = Event.find_or_create_by(name: event_name) do |event|
        event.games = games
        event.sport = row_sport
      end

      OlympianEvent.create do |olympian_event|
        olympian_event.event = row_event
        olympian_event.olympian = row_olympian
        olympian_event.medal = medal
      end
    end
  end
end
