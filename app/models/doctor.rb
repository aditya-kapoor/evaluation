class Doctor < ActiveRecord::Base
  attr_accessible :name
  has_many :appointments, :dependent => :destroy
  # validates_associated :appointments, :message => "Invalid appointment time selected"
end
