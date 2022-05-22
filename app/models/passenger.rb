# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  name                 :string
#  email                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  booking_id           :integer
#
class Passenger < ApplicationRecord
  # The user belongs to a booking
  belongs_to :booking

  # Validations
  # Name must be present, must be less than 20 characters
  # Email must be present, must confirm to email format, must be less than 20 characters
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 50 }
end
