class Unit
  @registered_units = {}

  def self.[](name, plural: "#{name}s")
    @registered_units[name] ||= new(name: name, plural: plural)
  end

  def initialize(name:, plural: )
    @name   = name
    @plural = plural
  end

  def *(number)
    Measure.for(amount: number, unit: self)
  end

  def to_s
    @name
  end

  def coerce(amount)
    raise TypeError, "Unit can't be coerced into Integer except for multiplication" unless caller.first.include?("`*'")

    [self, amount]
  end

  def name_for(amount)
    if amount == 1
      @name
    else
      @plural
    end
  end
end
