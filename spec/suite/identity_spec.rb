require "spec_helper"

RSpec.describe "Identity" do
  describe "units" do
    it "is equal to itself" do
      expect(BaseUnit["meter"]).to eql(BaseUnit["meter"])
    end

    it "is not equal to other unit" do
      expect(BaseUnit["meter"]).not_to eql(BaseUnit["centimeter"])
    end
  end

  describe "measures" do
    it "is equal to itself" do
      expect(BaseUnit["meter"] * 1).to eql(BaseUnit["meter"] * 1)
    end

    it "is not equal to other measure" do
      expect(BaseUnit["meter"] * 1).not_to eql(BaseUnit["meter"] * 2)
    end

    it "is equal to itself commutatively" do
      expect(BaseUnit["meter"] * 1).to eql(1 * BaseUnit["meter"])
    end
  end
end
