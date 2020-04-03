require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe "instance methods" do
    it "can assign a mechanic to a ride" do
      park_1 = AmusementPark.create(name:"Magic Mountain", admission_price:60)
      ride_1 = park_1.rides.create(name:"Yeet-Master", thrill_rating:8)
      ride_2 = park_1.rides.create(name:"CoronaVirus Streak-a-thon", thrill_rating:10)
      mechanic_1 = Mechanic.create(name:"Bob", years_experience: 5)

      mechanic_1.assign_to_ride(ride_1.id)

      expect(mechanic_1.rides[0].id).to eql(ride_1.id)
    end
  end
end
