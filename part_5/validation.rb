module Validation
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.include(InstanceMethods)
  end

  module ClassMethods
    def validate(attribute, check, options={})
      param = options.fetch(:param, nil)
      msg = options.fetch(:msg, 'Error')
      @validations ||= {}
      case check.to_sym
      when :presence
        func = ->(l_val, l_param = nil, l_msg) do
          return msg if l_val.nil? ||
                       l_val.size.zero?
        end
      when :format
        func = ->(l_val, l_param, l_msg) do
          return msg if l_val !~ l_param
        end
      when :type
        func = ->(l_val, l_param, l_msg) do
          return msg unless l_val.is_a?(l_param)
        end
      end

      @validations[func] = { attribute: attribute, param: param, msg: msg }
    end
  end

  module InstanceMethods
    def validate!
      errors = ''
      self.class.instance_variable_get(:@validations).each do |key, validation|
        value = instance_variable_get("@#{validation[:attribute]}".to_sym)
        result = key.call(value, validation[:param], validation[:msg])
        errors += "#{result}\n" unless result.nil?
      end
      raise ValidationError.new(errors) unless errors.size.zero?
      true
    end

    def valid?
      validate!
    rescue RuntimeError
      false
    end
  end
end

class ValidationError < StandardError
  def initialize(msg)
    super "You validation have failed, you have next errors:\n" << msg
  end
end
