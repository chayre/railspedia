class PassengersController < ApplicationController

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # POST /passengers or /passengers.json
  def create
    @passenger = Passenger.new(passenger_params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.require(:passenger).permit(:name, :email)
    end
end
