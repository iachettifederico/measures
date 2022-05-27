class Unit
  attr_reader :base_unit

  def self.registered_units
    @registered_units ||= {}
  end

  def *(number)
    Measure.for(amount: number, unit: self)
  end

  def base_unit?(a_unit)
    a_unit == base_unit
  end

  def to_s
    @name
  end

  def inspect
    "#{self.class}(#{@name})"
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
