class OlympianStats
  include ActiveModel::Serialization
  def initialize; end

  def total_competing_olympians
    Olympian.total_competing_olympians
  end

  def average_weight(sex)
    Olympian.average_weight(sex)
  end

  def average_age
    Olympian.average_age
  end
end
