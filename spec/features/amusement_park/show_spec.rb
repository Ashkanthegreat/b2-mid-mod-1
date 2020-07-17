require 'rails_helper'

RSpec.describe "Amusement Parks show page" do
  it "CAn see the name, price, all rides in alphabetical order, and average thrill rating of all the parks rides" do
    elitchs = AmusementPark.create(name: "Elitch Gardens", price: 40)

    twister = elitchs.rides.create(name: "Twister", thrill_rating: 9)
    chipmunk = elitchs.rides.create(name: "Chipmunk", thrill_rating: 8)
    teacups = elitchs.rides.create(name: "Tea Cups", thrill_rating: 4)

    visit "/amusement_parks/#{elitchs.id}"

    expect(page).to have_content("Elitch Gardens")
    expect(page).to have_content(elitchs.price)

    within("#ride-0") do
      expect(page).to have_content("Chipmunk")
    end

    within("#ride-1") do
      expect(page).to have_content("Tea Cups")
    end

    expect(page).to have_content("Average Thrill Rating: 7.0")

  end
end
