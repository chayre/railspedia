class FlightsController < ApplicationController
 
  # GET /flights or /flights.json
  def index
    # When index is called, return @dates instance variable which is the dates of all flights ordered (ascending) by time and mapped to month, date, year format
    # .uniq, otherwise we'll get a bunch of repeat dates
    @dates = Flight.all.order(:departure_time).map { |flight| (flight.departure_time.tomorrow).strftime("%m/%d/%Y") }.uniq
    @airports = Airport.all.map{ |airport| [airport.airport_id, airport.id] }

    # If the user hits search but both airports are the same, send a flash.now alert message
    if params[:commit] == "Search"
      if params[:departure_airport_id] == params[:arrival_airport_id]
        flash.now[:alert] = "Departure and arrival airports can't be the same."
      end
    end
    
    # After the user submits params with a date, return the flights corresponding to that date (#search method in flight model)
    if params[:date]
      @flights = Flight.search(params)
    end
  end
end
