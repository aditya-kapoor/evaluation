require 'acts_as_appointment'

class MovieShow < ActiveRecord::Base
  attr_accessible :start_time, :end_time
  acts_as_appointment(:start_time, :end_time)
end
