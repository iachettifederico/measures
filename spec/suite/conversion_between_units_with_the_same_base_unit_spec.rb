require "spec_helper"

RSpec.describe "conversion between units with the same base unit" do

  it "does something" do
    meter = BaseUnit["meter"]

    expect((10 * meter).to_base_unit).to eq(10 * meter)
  end

  it "does something" do
    meter     = BaseUnit["meter"]
    kilometer = DerivedUnit["kilometer", base_unit: meter, factor: 1000]

    expect((1 * kilometer).to_base_unit).to eq(1000 * meter)
  end

  it "does something" do
    meter = BaseUnit["meter"]

    expect((2 * meter).convert_to(meter)).to eq(2 * meter)
  end

  it "does something" do
    meter     = BaseUnit["meter"]
    kilometer = DerivedUnit["kilometer", base_unit: meter, factor: 1000]

    expect((1 * kilometer).convert_to(meter)).to eq(1000 * meter)
  end

  it "does something" do
    unidad  = BaseUnit["unidad"]
    decena  = DerivedUnit["decena",  base_unit: unidad, factor: 10]
    centena = DerivedUnit["centena", base_unit: unidad, factor: 100]

    expect((1 * centena).convert_to(decena)).to eq(10 * decena)
  end

end
