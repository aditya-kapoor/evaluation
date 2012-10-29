class Doctor < ActiveRecord::Base
  attr_accessible :name
  has_many :appointments, :dependent => :destroy
end
