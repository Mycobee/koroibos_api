class OlympianStats
  include ActiveModel::Serialization
  def initialize; end

  def total_competing_olympians
    Olympian.total_competing_olympians
  end

  #def average_weight
  #  Olympian.average_weight
  #end

  #def average_age
  #  Olympian.average_age
  #end
end
