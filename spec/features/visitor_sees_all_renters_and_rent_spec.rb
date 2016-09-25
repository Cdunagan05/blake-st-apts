require 'rails_helper'

RSpec.feature "When someone visits '/renters/'" do
  scenario "they see all renters, their monthly rent, cost per sqft, and more" do
    renter1 = Renter.create(first_name: "Jake", last_name: "Jones")
    renter2 = Renter.create(first_name: "Adam", last_name: "Arroyo")
    Unit.create(name: "1a", monthly_rent: 1500, square_footage: 1200, renter: renter1 )
    Unit.create(name: "1b", monthly_rent: 1800, square_footage: 1300, renter: renter2 )

    visit renters_path

    expect(page).to have_content("Jake Jones: 1a - $1500 per month, $1.25 per sqft")
    expect(page).to have_content("Adam Arroyo: 1b - $1800 per month, $1.38 per sqft")
    expect(page).to have_content("$1.32 per sqft for all renters")

  end
end
