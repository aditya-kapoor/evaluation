require 'acts_as_appointment'

class Appointment < ActiveRecord::Base
  # include ActsAsAppointment
  attr_accessible :from_time, :to_time
  # acts_as_appointment
  acts_as_appointment(:tutu, :aditya)
  belongs_to :doctor
end
