require "spec_helper"

RSpec.describe "Identity" do
  describe "units" do
    it "is equal to itself" do
      expect(Unit["meter"]).to eql(Unit["meter"])
    end

    it "is not equal to other unit" do
      expect(Unit["meter"]).not_to eql(Unit["centimeter"])
    end
  end

  describe "measures" do
    it "is equal to itself" do
      expect(Unit["meter"] * 1).to eql(Unit["meter"] * 1)
    end

    it "is not equal to other measure" do
      expect(Unit["meter"] * 1).not_to eql(Unit["meter"] * 2)
    end

    it "is equal to itself commutatively" do
      expect(Unit["meter"] * 1).to eql(1 * Unit["meter"])
    end
  end
end
