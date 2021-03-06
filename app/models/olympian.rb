class Olympian < ApplicationRecord
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  validates_presence_of :name, :sex, :age, :height, :weight, :team, :total_medals_won

  def medal_count 
    olympian_events.where.not(medal: 'NA').count
  end
  
  def self.youngest
    order(age: :asc).first
  end

  def self.oldest
    order(age: :desc).first
  end

  def self.total_competing_olympians
    count
  end

  def self.average_weight(sex)
    where(sex: sex).average(:weight).to_f.round(1)
  end

  def self.average_age
    average(:age).to_f.round(1)
  end
end
