class OlympianStatsSerializer < ActiveModel::Serializer
  attributes :total_competing_olympians #, :average_weight, :average_age

  def total_competing_olympians
    self.object.total_competing_olympians
  end
end
