class DerivedUnit < Unit
  attr_reader :base_unit
  attr_reader :factor

  def self.[](name, plural: "#{name}s", base_unit:, factor: 1)
    registered_units[name] ||= new(name: name, plural: plural, base_unit: base_unit, factor: factor)
  end

  def initialize(name:, plural:, base_unit:, factor: )
    @name   = name
    @plural = plural
    @base_unit = base_unit
    @factor = factor
  end

end
