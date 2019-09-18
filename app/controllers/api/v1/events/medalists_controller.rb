class Api::V1::Events::MedalistsController < ApplicationController
  before_action :set_event, only: [:index] 

	def index
    render json: MedalistSerializer.new(@event).build_medalist_hash 
	end
  
  private

  def set_event
    @event = Event.find_by(id: params[:id])
    not_found if @event.nil?  
  end
end

