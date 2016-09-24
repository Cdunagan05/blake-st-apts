require 'rails_helper'

RSpec.describe Unit, type: :model do
  it "calculates average price per square foot" do
    unit = Unit.create(name: "1a", square_footage: 1000, monthly_rent: 1000)

    expect(unit.avg_per_sqft).to eq(1)
  end

  it "returns 0 if there is not a square footage or monthly rent" do
    unit = Unit.create(name: "1a", monthly_rent: 1000)

    expect(unit.avg_per_sqft).to eq(0)
  end
end
