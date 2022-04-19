require "spec_helper"

RSpec.describe "" do
  let(:meter) { Unit["meter"] }

  describe "#to_s" do
    it "does something" do
      one_meter = meter * 1

      expect(one_meter.to_s).to eq("1 meter")
    end

    it "does something" do
      one_meter = meter * 2

      expect(one_meter.to_s).to eq("2 meters")
    end

    it "does something" do
      one_meter = Unit["octopus", plural: "octopi"] * 2

      expect(one_meter.to_s).to eq("2 octopi")
    end
  end

end
