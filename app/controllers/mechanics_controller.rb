class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mechanic_id])
  end

  def update
    mechanic = Mechanic.find(params[:mechanic_id])
    mechanic.assign_to_ride(strong_params[:ride_id])
    redirect_to "/mechanics/#{mechanic.id}"
  end

  private
  def strong_params
    params.permit(:ride_id, :mechanic_id)
  end
end
