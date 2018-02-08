module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      history_name = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_set(history_name, instance_variable_get(history_name).to_a.push(value))
      end

      define_method("#{name}_history") { instance_variable_get(history_name) }
    end
  end

  def strong_attr_acessor(name, klass)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      raise 'Wrong type of assignment value!' unless value.is_a?(klass)
      instance_variable_set(var_name, value)
    end
  end
end
