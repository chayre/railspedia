# == Schema Information
#
# Table name: bookings
#
#  id                   :integer          not null, primary key
#  airport_id           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Airport < ApplicationRecord
  # Each airport has many outgoing and inbound flights
  has_many :departing_flights, :foreign_key => :departure_airport_id, class_name: "Flight"
  has_many :arriving_flights, :foreign_key => :arrival_airport_id, class_name: "Flight"
end
