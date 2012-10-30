require 'acts_as_appointment'

class Appointment < ActiveRecord::Base
  # include ActsAsAppointment
  acts_as_appointment(:from_time, :to_time)
  belongs_to :doctor
end
