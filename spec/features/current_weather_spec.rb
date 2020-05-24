require 'rails_helper'

describe "it knows the weather" do
  it "I should see the weather of the destination I'm looking at" do
    tlh = Destination.create(name: 'Tallahassee',
                             zip: '32317',
                             description: 'Near the Florida Georgia Line',
                             image_url: Faker::Placeholdit.image)

    visit root_path

    within ".destination-#{tlh.id}" do
      click_link "Show"
    end

    expect(current_path).to eq destination_path(tlh.id)

    expect(page).to have_content tlh.name
    expect(page).to have_content tlh.zip
    expect(page).to have_content tlh.description

    expect(page).to have_css(".weather")

  end
end
# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description,
#and current weather
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), current, high
# and low temps in Fahrenheit, and a summary (for example "light rain",
# "clear sky", etc.)
