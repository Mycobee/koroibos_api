class OlympianStatsSerializer < ActiveModel::Serializer
  attributes :total_competing_olympians, :average_weight, :average_age

  def total_competing_olympians
    self.object.total_competing_olympians
  end

  def average_weight
    { 
      "unit": "kg",
      "male_olympians": self.object.average_weight('M'),
      "female_olympians": self.object.average_weight('F')
    }
  end
    
  def average_age
    self.object.average_age
  end
end
