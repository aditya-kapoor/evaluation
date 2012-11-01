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
        validate :validate_schedule, :check_for_valid_time_slot
      end
    end

    def validate_schedule
      from, to = get_attributes[0], get_attributes[1]
      if from > to
        errors.add("#{self.class.to_s.parameterize}_time".to_sym, "Invalid appointment time selected") 
      end
    end

    def check_for_valid_time_slot
      selected_appointments = self.class.to_s.constantize.where("#{$val2.to_s} > ?", self.attributes[$val1.to_s])
      if selected_appointments.any?
        errors.add("#{self.class.to_s.parameterize}_slot".to_sym, "This #{self.class.to_s} is Clashing with some other #{self.class.to_s}")
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