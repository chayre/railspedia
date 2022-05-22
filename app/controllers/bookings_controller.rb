class BookingsController < ApplicationController
  
  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/new
  def new
    # Find values from by querying active record with submitted params
    @flight = Flight.find_by(id: params[:flight_id])
    @booking = @flight.bookings.build
    @passenger_number = params[:passengers].to_i
    @passenger_number.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create!(booking_params)
    # This if/else calls .save; if successful, it will redirect to the show page and flash a notice. Otherwise it redirects to new page again and flashes alert.
    if @booking.save
      flash[:notice] = "Booking submitted!"
      UserMailer.thank_you_email(@booking.passengers.first).deliver_now!
      redirect_to @booking
    else
      flash[:alert] = "Submission error"
      redirect_to @booking.new
    end
  end

  def show
    # Load the booking we just created by querying the database with the submitted id
    @booking = Booking.find(params[:id])
    # Load the flight associated with the booking by querying the database with the submitted id
    @flight = Flight.find(@booking.flight_id)
    # Load the submitted passengers by searching the passenger table for booking_ids that match the submitted id
    @passenger = Passenger.where(booking_id: params[:id])
  end

  private

  def booking_params 
    params.require(:booking).permit(:flight_id,
                                    :passengers_attributes => [:name, :email])
  end

end
