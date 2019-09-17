class Api::V1::OlympiansController < ApplicationController
	def index
    if !olympian_params[:age]
      olympians = Olympian.all
      render json: olympians, each_serializer: OlympianSerializer
    else 
      render json: Olympian.return_by_age(olympian_params[:age])
    end
	end

  private

  def olympian_params
    params.permit(:age)
  end
end

