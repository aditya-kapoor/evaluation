module ActsAsAppointment
  
  def acts_as_appointment(val1, val2)
    class_eval do 
      attr_accessible val1.to_sym, val2.to_sym
      include ClassMethods
    end
  end

  module ClassMethods

    def self.included(klass)
      klass.instance_eval do
        validate :validate_schedule
      end
    end

    def validate_schedule
      from, to = get_attributes
      if from[1] > to[1]
        errors.add(:appointment_time, "Invalid appointment time selected") 
      end
    end
    def get_attributes
      self.attributes.take(3).drop(1)
    end
  end
end

ActiveRecord::Base.extend ActsAsAppointment