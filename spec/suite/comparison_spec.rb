require "spec_helper"

RSpec.describe "addition and substraction" do
  let(:meter)        { Medidas::BaseUnit["meter"] }
  let(:centimeter)   { Medidas::DerivedUnit["centimeter", base_unit: meter, factor: Rational(1, 100)] }
  let(:liter)        { Medidas::BaseUnit["liter"] }

  it "does something" do
    expect(1 * meter == 1 * meter).to eq(true)
  end

  it "does something" do
    expect {
      expect(2 * meter <=> 1)
    }.to raise_error(Medidas::Measure::CANT_APPLY_OPERATION)
  end

  it "does something" do
    expect {
      expect(2 * meter <=> 1 * liter)
    }.to raise_error(Medidas::Measure::CANT_APPLY_OPERATION)
  end

  it "does something" do
    expect(2 * meter <=> 2 * meter).to eq(0)
  end

  it "does something" do
    expect(2 * meter <=> 1 * meter).to eq(1)
  end

  it "does something" do
    expect(2 * meter <=> 5 * meter).to eq(-1)
  end

  it "does something" do
    expect(1 * meter <=> 100 * centimeter).to eq(0)
  end

end
