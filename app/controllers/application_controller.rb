class ApplicationController < ActionController::API
  def bad_request
    render json: { error: 'bad request' }, status: :bad_request
  end
end
