require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it {should have_many :rides}
  end

  describe "instance methods" do
    it "can calculate the average thrill rating of all rides in the park" do
      park_1 = AmusementPark.create(name:"Magic Mountain", admission_price:60)
      ride_1 = park_1.rides.create(name:"Yeet-Master", thrill_rating:8)
      ride_2 = park_1.rides.create(name:"CoronaVirus Streak-a-thon", thrill_rating:10)
      ride_3 = park_1.rides.create(name:"Shopping Cart Ride", thrill_rating:2)

      expect(park_1.average_thrill_rating).to eql(6.7)
    end
  end
end
