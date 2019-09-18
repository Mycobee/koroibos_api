class MedalistSerializer
  def initialize(event)
    @event = event
  end

  def build_medalist_array
    @event.get_medalists.map do |medalist|
      { name: medalist.olympian.name,
        team: medalist.olympian.team,
        age: medalist.olympian.age,
        medal: medalist.medal
      }
    end
  end

  def build_medalist_hash
    { event: @event.name,
      medalists: build_medalist_array
    }
  end
end
