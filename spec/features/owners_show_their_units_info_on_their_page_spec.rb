require 'rails_helper'

RSpec.feature "When I visit /owners" do
  scenario "I see a link to click on a particular owners page" do
    owner1 = Owner.create(first_name: "Jessica", last_name: "Jones")
    owner2 = Owner.create(first_name: "Luke", last_name: "Cage")
    owner1.units.create(name: "1a", monthly_rent: 900)
    owner1.units.create(name: "1b", monthly_rent: 1100)
    owner2.units.create(name: "2a", monthly_rent: 1500)

    visit owners_path

    click_link 'Jessica Jones'

    expect(current_path).to eq(owner_path(owner1))

    expect(page).to have_content("Jessica Jones")
    expect(page).to have_content("1a: $900 per month")
    expect(page).to have_content("1b: $1100 per month")
    expect(page).to have_content("Total rent paid to Jessica per month: $2000")

  end
end
