require "spec_helper"

RSpec.describe "Identity" do
  describe "units" do
    it "is equal to itself" do
      expect(Medidas::BaseUnit["meter"]).to eql(Medidas::BaseUnit["meter"])
    end

    it "is not equal to other unit" do
      expect(Medidas::BaseUnit["meter"]).not_to eql(Medidas::BaseUnit["centimeter"])
    end
  end

  describe "measures" do
    it "is equal to itself" do
      expect(Medidas::BaseUnit["meter"] * 1).to eql(Medidas::BaseUnit["meter"] * 1)
    end

    it "is not equal to other measure" do
      expect(Medidas::BaseUnit["meter"] * 1).not_to eql(Medidas::BaseUnit["meter"] * 2)
    end

    it "is equal to itself commutatively" do
      expect(Medidas::BaseUnit["meter"] * 1).to eql(1 * Medidas::BaseUnit["meter"])
    end
  end
end
