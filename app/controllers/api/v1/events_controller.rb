class Api::V1::EventsController < ApplicationController
	def index
    render json: EventSerializer.new.build_event_hash
	end
end

