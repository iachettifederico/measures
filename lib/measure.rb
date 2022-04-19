class Measure
  @registered_measures = {}

  def self.for(amount:, unit:)
    @registered_measures[[amount, unit]] ||= new(amount: amount, unit: unit)
  end

  def initialize(amount:, unit:)
    @amount = amount
    @unit   = unit
  end

  def to_s
    "#@amount #{@unit.name_for(@amount)}"
  end

  def inspect
    "#{self.class}(#{@amount} #{@unit.to_s})"
  end

end
