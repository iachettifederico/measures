require "spec_helper"

RSpec.describe "" do
  let(:meter) { Unit["meter"] }

  describe "#to_s" do
    describe "units" do
      it "returns the name" do
        expect(Unit["meter"].to_s).to eq("meter")
      end
    end

    describe "measures" do
      it "returns a string that represents a singular measure" do
        one_meter = meter * 1

        expect(one_meter.to_s).to eq("1 meter")
      end

      it "returns a string that represents a plural measure" do
        one_meter = meter * 2

        expect(one_meter.to_s).to eq("2 meters")
      end

      it "returns a string that represents a custom plural measure" do
        two_octopi = Unit["octopus", plural: "octopi"] * 2

        expect(two_octopi.to_s).to eq("2 octopi")
      end
    end
  end

  describe "#inspect" do
    describe "units" do
      it "returns the name" do
        expect(Unit["meter"].inspect).to eq("Unit(meter)")
      end
    end

    describe "measures" do
      it "returns a string that represents a singular measure" do
        expect((1*meter).inspect).to eq("Measure(1 meter)")
        expect((2*meter).inspect).to eq("Measure(2 meter)")
      end

      it "returns a string that represents a custom plural measure" do
        two_octopi = Unit["octopus", plural: "octopi"] * 2

        expect(two_octopi.inspect).to eq("Measure(2 octopus)")
      end
    end
  end

end
