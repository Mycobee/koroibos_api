namespace :set_medals do
  task :data => :environment do
    olympians = Olympian.all
    
    olympians.each do |olympian|
      count = olympian.medal_count
      olympian.total_medals_won = count
      olympian.save
    end
  end
end
