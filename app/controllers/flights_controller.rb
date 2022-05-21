class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    # When index is called, return @dates instance variable which is the dates of all flights ordered (ascending) by time and mapped to month, date, year format
    # .uniq, otherwise we'll get a bunch of repeat dates
    @dates = Flight.all.order(:departure_time).map { |flight| flight.departure_time.strftime("%m/%d/%Y") }.uniq
    @airports = Airport.all.map{ |airport| [airport.airport_id, airport.id] }
    
    
    if params[:commit] == "Search"
      if params[:departure_airport_id] == params[:arrival_airport_id]
        flash.now[:error] = "Departure and arrival airports can't be the same."
      end
    end


    if params[:date]
      @flights = Flight.search(params)
    end
  end

  # GET /flights/1 or /flights/1.json
  #def show
 # end

  #private
    # Use callbacks to share common setup or constraints between actions.
    #def set_flight
    #  @flight = Flight.find(params[:id])
    #end

    # Only allow a list of trusted parameters through.
   # def flight_params
   #   params.permit(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :flight_duration, :date, :commit)
  #  end
end
