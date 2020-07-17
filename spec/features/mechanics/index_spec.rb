require 'rails_helper'

RSpec.describe "mechanics index page" do
  it "as a visitor when I visit mechanics index page, I see each mechanic and years of experience" do

    mech1 = Mechanic.create(name: "Joe", years_of_experience: 12)
    mech2 = Mechanic.create(name: "Jim", years_of_experience: 16)

    visit '/mechanics'

    expect(page).to have_content(mech1.name)
    expect(page).to have_content(mech1.years_of_experience)
    expect(page).to have_content(mech2.name)
    expect(page).to have_content(mech2.years_of_experience)
  end
end
