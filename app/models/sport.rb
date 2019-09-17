class Sport < ApplicationRecord
  has_many :events
  has_many :olympians
  validates :name, presence: true, uniqueness: true
end
