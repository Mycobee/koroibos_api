class OlympianEvent < ApplicationRecord
  belongs_to :event
  belongs_to :olympian
  validates_presence_of :medal
end
