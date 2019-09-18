class ApplicationController < ActionController::API
  def bad_request
    render json: { error: 'bad request' }, status: :bad_request
  end

	def not_found
    render json: { error: "not found" }, status: :not_found
	end
end
