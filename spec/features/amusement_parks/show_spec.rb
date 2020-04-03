require 'rails_helper'

RSpec.describe "As a visitor on the amusement parks show page", type: :feature do
  it "I see the name and price of admission for that amusement park" do
    park_1 = AmusementPark.create(name:"Magic Mountain", admission_price:60)

    visit "/amusement_parks/#{park_1.id}"

    expect(page).to have_content(park_1.name)
    expect(page).to have_content("Admissions: $#{park_1.admission_price}")
  end

  it "I can see the names of all the rides that are at that theme park listed in alphabetical order " do
    park_1 = AmusementPark.create(name:"Magic Mountain", admission_price:60)
    ride_1 = park_1.rides.create(name:"Yeet-Master", thrill_rating:8)
    ride_2 = park_1.rides.create(name:"CoronaVirus Streak-a-thon", thrill_rating:10)
    ride_3 = park_1.rides.create(name:"Shopping Cart Ride", thrill_rating:2)

    visit "/amusement_parks/#{park_1.id}"

    within('.park-rides-index') do
      expect(page).to have_content(ride_2.name)

      expect(page).to have_content(ride_3.name)

      expect(page).to have_content(ride_1.name)

    end
  end
end
