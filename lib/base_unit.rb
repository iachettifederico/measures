class BaseUnit < Unit
  def self.[](name, plural: "#{name}s")
    registered_units[name] ||= new(name: name, plural: plural)
  end

  def initialize(name:, plural: )
    @name   = name
    @plural = plural
  end

  def base_unit
    self
  end

  def factor
    1
  end
end
