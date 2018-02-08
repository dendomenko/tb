module Validation
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.include(InstanceMethods)
  end

  module ClassMethods
    def validate(attribute, check, param = nil)
      @validations ||= self.class.instance_variable_get(:@validations) || {}
      case check.to_sym
      when :presence
        func = ->(l_attr, l_val, l_param = nil) do
          raise "#{l_attr} can't be nil or 0 size!" if l_val.nil? ||
                                                       l_val.size.zero?
        end
      when :format
        func = ->(l_attr, l_val, l_param) do
          raise "#{l_attr} has invalid format" if l_val !~ l_param
        end
      when :type
        func = ->(l_attr, l_val, l_param) do
          raise "Wrong type of #{l_attr}!" unless l_val.is_a?(l_param)
        end
      end
      @validations[func] = { attribute: attribute, param: param }
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get(:@validations).each do |key, validation|
        attribute = validation[:attribute].to_s
        value = instance_variable_get("@#{validation[:attribute]}".to_sym)
        key.call(attribute, value, validation[:param])
      end
      true
    end

    def valid?
      validate!
    rescue RuntimeError
      false
    end
  end
end
