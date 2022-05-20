# == Schema Information
#
# Table name: bookings
#
#  id                   :integer          not null, primary key
#  flight_id           :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Booking < ApplicationRecord
  # Each booking corresponds to a single flight
  belongs_to :flight

  # Each booking may have many passengers
  has_many :passengers

  # In the form, will accept attributes for a seperate model
  accept_nested_attributes_for :passengers
end
