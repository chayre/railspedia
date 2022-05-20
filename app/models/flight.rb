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
end
