class Measure
  attr_reader :amount

  @registered_measures = {}

  def self.for(amount:, unit:)
    @registered_measures[[amount, unit]] ||= new(amount: amount, unit: unit)
  end

  def initialize(amount:, unit:)
    @amount = amount
    @unit   = unit
  end

  def +(other_measure)
    assert_same_unit!(other_measure)

    unit * (amount + other_measure.amount)
  end

  def -(other_measure)
    assert_same_unit!(other_measure)

    unit * (amount - other_measure.amount)
  end

  def -@
    unit * (amount * -1)
  end

  def to_s
    "#{amount} #{unit.name_for(amount)}"
  end

  def inspect
    "#{self.class}(#{amount} #{unit.to_s})"
  end

  def unit?(potential_unit)
    unit == potential_unit
  end

  private

  attr_reader :unit

  def assert_same_unit!(a_measure)
    raise CANT_APPLY_OPERATION unless a_measure.unit?(unit)
  end

  CANT_APPLY_OPERATION="Can't apply operation"
end
