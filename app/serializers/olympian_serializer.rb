class OlympianSerializer < ActiveModel::Serializer
  attributes :name, :team, :sport, :total_medals_won 

  def sport
    self.object.sport.name
  end
end
