# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  departure_airport_id    :integer
#  arrival_airport_id      :integer
#  departure_time          :datetime
#  flight_duration         :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Flight < ApplicationRecord
  # Each flight can have many bookings
  has_many :bookings
  # The flight's departure airport belongs to the airport
  belongs_to :departure_airport, class_name: "Airport"
  # The flight's departure airport belongs to the airport
  belongs_to :arrival_airport, class_name: "Airport"

  # Method to select and return all flights that match user query (submitted via params)
  def self.search(params)
    # Convert user submitted time to datetime of form month/day/year
    date = DateTime.strptime(params[:date], "%m/%d/%Y")
    # Select Flights from database where the departure_airport, arrival_airport, and departure_time match the user's query
    Flight.where(
      departure_airport_id: params[:departure_airport_id],
      arrival_airport_id: params[:arrival_airport_id],
      departure_time: date
      )
    end
end
