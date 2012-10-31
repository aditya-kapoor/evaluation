module ActsAsAppointment
  @val1 = ""
  @val2 = ""
  def acts_as_appointment(val1, val2)
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
      @val1, @val2 = get_attributes
      if @val1[1] > @val2[1]
        errors.add(:appointment_time, "Invalid appointment time selected") 
      end
    end
    
    def get_attributes
      self.attributes.take(3).drop(1)
    end
  end
end

ActiveRecord::Base.extend ActsAsAppointment