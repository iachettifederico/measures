require 'bigdecimal'

module Medidas
  class Measure
    include Comparable

    attr_reader :amount
    attr_reader :unit

    @registered_measures = {}

    def self.for(amount:, unit:)
      @registered_measures[[amount, unit]] ||= new(amount: amount, unit: unit)
    end

    def initialize(amount:, unit:)
      @amount = BigDecimal(amount.to_s)
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

    def *(a_number)
      raise CANT_APPLY_OPERATION unless a_number.is_a?(Numeric)

      (a_number * amount) * unit
    end

    def /(a_divisor)
      raise CANT_APPLY_OPERATION if a_divisor.is_a?(Measure) && !a_divisor.unit?(unit)

      if a_divisor.is_a?(Numeric)
        (amount / a_divisor) * unit
      else
        amount / a_divisor.amount
      end
    end

    def -@
      unit * (amount * -1)
    end

    def to_base_unit
      amount * unit.factor * unit.base_unit
    end

    def base_unit?(a_unit)
      unit.base_unit?(a_unit)
    end

    def base_unit
      unit.base_unit
    end

    def convert_to(unit)
      (to_base_unit.amount / unit.factor) * unit
    end

    def <=>(other_measure)
      raise CANT_APPLY_OPERATION unless other_measure.is_a?(Measure) && other_measure.base_unit?(unit.base_unit)

      to_base_unit.amount <=> other_measure.to_base_unit.amount
    end

    def to_s
      "#{text_for_amount} #{unit.name_for(amount)}"
    end

    def inspect
      "#{self.class}(#{text_for_amount} #{unit.to_s})"
    end

    def unit?(potential_unit)
      unit == potential_unit
    end

    private

    def assert_same_unit!(a_measure)
      raise CANT_APPLY_OPERATION unless a_measure.unit?(unit)
    end

    def text_for_amount
      if amount.truncate==amount
        amount.to_i
      else
        amount.to_f
      end
    end

    CANT_APPLY_OPERATION="Can't apply operation"
  end
end
