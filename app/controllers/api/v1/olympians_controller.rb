class Api::V1::OlympiansController < ApplicationController
	def index
    if params.keys == ["controller", "action"]
      olympians = Olympian.all
      render json: olympians, each_serializer: OlympianSerializer
    elsif olympian_params[:age] == 'youngest'
      render json: Olympian.youngest
    elsif olympian_params[:age] == 'oldest'
      render json: Olympian.oldest
    else 
      bad_request
    end
	end

  private

  def olympian_params
    params.permit(:age)
  end
end

