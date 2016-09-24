require 'rails_helper'

RSpec.feature "When someone visits '/units'" do
  scenario "they see a list of units" do
    Unit.create(name: "1a", square_footage: 1000, monthly_rent: 1000)
    Unit.create(name: "1b", square_footage: 1000, monthly_rent: 1000)

    visit units_path

    expect(page).to have_content("1a")
    expect(page).to have_content("1b")
  end
end
