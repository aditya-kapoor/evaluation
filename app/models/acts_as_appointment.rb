module ActsAsAppointment
  def acts_as_appointment(val1, val2)
    $val1 = val1.to_sym
    $val2 = val2.to_sym
    class_eval do
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
      from, to = get_attributes[0], get_attributes[1]
      if from > to
        errors.add(:appointment_time, "Invalid appointment time selected") 
      end
    end
    
    def get_attributes
      from_time = self.attributes[$val1.to_s]
      to_time = self.attributes[$val2.to_s]
      return from_time, to_time
    end
  end
end

ActiveRecord::Base.extend ActsAsAppointment