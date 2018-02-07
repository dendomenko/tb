module InstanceCounter
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.include(InstanceMethods)
  end

  module ClassMethods
    attr_accessor :instances_counter
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances_counter = 0 if self.class.instances_counter.nil?
      self.class.instances_counter += 1
    end
  end
end
