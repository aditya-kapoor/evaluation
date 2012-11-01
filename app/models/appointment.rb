require 'acts_as_appointment'

class Appointment < ActiveRecord::Base
  # include ActsAsAppointment
  attr_accessible :from_time, :to_time
  # acts_as_appointment
  acts_as_appointment(:from_time, :to_time)
  belongs_to :doctor
end


# todo : concept of slots