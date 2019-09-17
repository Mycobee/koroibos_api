class Api::V1::OlympiansController < ApplicationController
	def index
    if olympian_params.keys.empty?
      olympians = Olympian.all
      render json: olympians, each_serializer: OlympianSerializer
    elsif olympian_params[:age] == 'youngest'
      render json: Olympian.youngest
    else 
      bad_request
    end
	end

  private

  def olympian_params
    params.permit(:age)
  end
end

