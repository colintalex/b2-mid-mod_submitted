require 'rails_helper'

RSpec.describe "As a visitor on a mechanics show page", type: :feature do
  it "I can see their name, years of experience, and names of all rides they’re working on" do
    park_1 = AmusementPark.create(name:"Magic Mountain", admission_price:60)
    ride_1 = park_1.rides.create(name:"Yeet-Master", thrill_rating:8)
    ride_2 = park_1.rides.create(name:"CoronaVirus Streak-a-thon", thrill_rating:10)
    ride_3 = park_1.rides.create(name:"Shopping Cart Ride", thrill_rating:2)
    mechanic_1 = Mechanic.create(name:"Bob", years_experience: 5)

    mechanic_1.assign_to_ride(ride_1.id)
    mechanic_1.assign_to_ride(ride_2.id)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)

    within('.rides-assignments') do
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
    end
  end

  it "I can see a form to add a ride to their workload, submit  an existing ride_id and am taken back to the mech show page" do
    park_1 = AmusementPark.create(name:"Magic Mountain", admission_price:60)
    ride_1 = park_1.rides.create(name:"Yeet-Master", thrill_rating:8)
    ride_2 = park_1.rides.create(name:"CoronaVirus Streak-a-thon", thrill_rating:10)
    ride_3 = park_1.rides.create(name:"Shopping Cart Ride", thrill_rating:2)
    mechanic_1 = Mechanic.create(name:"Bob", years_experience: 5)

    mechanic_1.assign_to_ride(ride_1.id)
    mechanic_1.assign_to_ride(ride_2.id)

    visit "/mechanics/#{mechanic_1.id}"
    save_and_open_page
    within('#assign-ride-form') do
      fill_in :ride_id, with: ride_3.id
      click_on 'Submit'
    end

    expect(current_path).to eql("/mechanics/#{mechanic_1.id}")
    save_and_open_page

    within('.rides-assignments') do
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_3.name)
    end

  end
end
