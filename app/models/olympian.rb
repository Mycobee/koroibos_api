class Olympian < ApplicationRecord
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  validates_presence_of :name, :sex, :age, :height, :weight, :team, :total_medals_won

  def medal_count 
    olympian_events.where.not(medal: 'NA').count
  end
  
  def self.return_by_age(age)
    if age == 'youngest'
      order(age: :asc).first
    elsif age == 'oldest'
      order(age: :desc).first 
    else 
      puts 'invalid_request'
    end
  end
end
