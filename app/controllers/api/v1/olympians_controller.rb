class Api::V1::OlympiansController < ApplicationController
	def index
    olympians = Olympian.all
    render :json => olympians, each_serializer: OlympianSerializer
	end
end

