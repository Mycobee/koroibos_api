class Event < ApplicationRecord
  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events
  validates :name, presence: true
  validates :games, presence: true

  def get_medalists
    self.olympian_events.where.not(medal: "NA").includes(:olympian)
  end
end
