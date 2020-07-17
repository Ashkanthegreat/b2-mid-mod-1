require 'rails_helper'

RSpec.describe "mechanics show page" do
  it "as a visitor when I visit mechanics index page, I see their name, year of experience, and all rides they're working on" do
    mech1 = Mechanic.create(name: "Joe", years_of_experience: 12)

    elitchs = AmusementPark.create(name: "Elitch Gardens", price: 40)

    twister = elitchs.rides.create(name: "Twister", thrill_rating: 9)
    chipmunk = elitchs.rides.create(name: "Chipmunk", thrill_rating: 8)

    MechanicRide.create(mechanic: mech1, ride: twister)
    MechanicRide.create(mechanic: mech1, ride: chipmunk)

    visit "/mechanics/#{mech1.id}"

    expect(page).to have_content(mech1.name)
    expect(page).to have_content(mech1.years_of_experience)
    expect(page).to have_content("Twister")
    expect(page).to have_content("Chipmunk")





  end
end

# And I also see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
# Add a ride to workload:
# _pretent_this_is_a_textfield_
#                       Submit
