require 'rails_helper'

RSpec.feature "When someone visits /users" do
  scenario "they see a list of units and their information" do
    Unit.create(name: "101", square_footage: 1000, monthly_rent: 900)
    Unit.create(name: "102", square_footage: 800, monthly_rent: 750)

    visit units_path

    expect(page).to have_content("Apartment #101")
    expect(page).to have_content("Apartment #102")
    expect(page).to have_content("Sqft: 1000, $900 per month, $.9 per sqft")
    expect(page).to have_content("Sqft: 800, $750 per month, $.94 per sqft")
  end
end
