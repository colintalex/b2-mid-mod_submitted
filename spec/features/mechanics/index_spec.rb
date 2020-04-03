require 'rails_helper'

RSpec.describe "As a visitor on the mechanics index page", type: :feature do
  it "I can see an All Mechanics header and a list of mechanics name and years experience" do
      mechanic_1 = Mechanic.create(name:"Bob", years_experience: 5)
      mechanic_2 = Mechanic.create(name:"Tim", years_experience: 6)
      mechanic_3 = Mechanic.create(name:"Rob", years_experience: 2)
      mechanic_4 = Mechanic.create(name:"Fil", years_experience: 4)

      visit '/mechanics'

      expect(page).to have_content("All Mechanics")

      within('.mechanics-index') do
        expect(page).to have_content("#{mechanic_1.name}: #{mechanic_1.years_experience} years of experience")

        expect(page).to have_content("#{mechanic_2.name}: #{mechanic_2.years_experience} years of experience")

        expect(page).to have_content("#{mechanic_3.name}: #{mechanic_3.years_experience} years of experience")

      end
  end
end
