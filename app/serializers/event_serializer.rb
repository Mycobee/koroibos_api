class EventSerializer
  def initialize
    @event_data = Sport.all.includes(:events) 
  end

  def map_events
    @event_data.map do |sport|
      {
        sport: sport.name,
        events: sport.events.pluck(:name)
      }
    end
  end

  def build_event_hash
    { events: 
       map_events 
    }.to_json
  end
end
