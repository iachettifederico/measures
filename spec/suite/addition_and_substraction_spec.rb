require "spec_helper"

RSpec.describe "addition and substraction" do
  let(:meter)        { Unit["meter"] }
  let(:liter)        { Unit["liter"] }
  let(:one_meter)    { 1 * meter }
  let(:two_meters)   { 2 * meter }
  let(:three_meters) { 3 * meter }

  it "adds two measures of the same unit together" do
    expect(one_meter + two_meters).to eq(three_meters)
  end

  it "substracts two measures of the same unit together" do
    expect(one_meter - two_meters).to eq(-one_meter)
  end

  it "can't add two measures of different units" do
    expect {
      one_meter + (1 * liter)
    }.to raise_error(RuntimeError, Measure::CANT_APPLY_OPERATION)
  end

  it "can't substract two measures of different units" do
    expect {
      one_meter - (1 * liter)
    }.to raise_error(RuntimeError, Measure::CANT_APPLY_OPERATION)
  end

  # DONE suma y resta entre measures de la misma unidad
  # suma y resta entera entre measures de la misma familia de unidades (1m, 100cm)
  # suma y resta fraccionaria entre measures de la misma familia de unidades (1m, 1cm)
  # suma y resta entre measures de distintas familias de unidades (m, lt)
end
