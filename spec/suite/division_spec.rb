require "spec_helper"

RSpec.describe "division" do
  let(:meter)        { BaseUnit["meter"] }
  let(:liter)        { BaseUnit["liter"] }
  let(:one_meter)    { 1 * meter }
  let(:two_meters)   { 2 * meter }
  let(:four_meters)  { 4 * meter }
  let(:eight_meters) { 8 * meter }

  it "returns itself when divided by one" do
    expect(one_meter / 1).to eq(one_meter)
  end

  it "it can divide by a number" do
    expect(two_meters / 2).to eq(one_meter)
  end

  it "it can divide by a measure of the same unit" do
    expect(two_meters / two_meters).to eq(1)
    expect(eight_meters / two_meters).to eq(4)
  end

  it "it can't divide by a measure of a different unit" do
    expect {
      eight_meters / (1 * liter)
    }.to raise_error(RuntimeError, Measure::CANT_APPLY_OPERATION)
  end

end
