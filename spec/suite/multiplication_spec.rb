require "spec_helper"

RSpec.describe "multiplication" do
  let(:meter)      { Unit["meter"] }
  let(:one_meter)  { 1 * meter }
  let(:two_meters) { 2 * meter }

  it "does something" do
    expect(one_meter * 1).to eq(one_meter)
  end

  it "does something" do
    expect(one_meter * 2).to eq(two_meters)
  end

  it "does something" do
    expect {
      one_meter * two_meters
    }.to raise_error(RuntimeError, Measure::CANT_APPLY_OPERATION)
  end
  
end
