class Api::V1::OlympianStatsController < ApplicationController
	def show
    facade = OlympianStats.new
    render json: (facade), serializer: OlympianStatsSerializer
	end
end

