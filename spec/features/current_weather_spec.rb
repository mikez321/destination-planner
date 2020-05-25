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

    within ".weather" do
      expect(page).to have_css(".date")
      expect(page).to have_css(".current")
      expect(page).to have_css(".high")
      expect(page).to have_css(".low")
      expect(page).to have_css(".summary")
      expect(page).to_not have_content 'unavailable'
    end
  end

  it 'will fail gracefully if a place does not have weather' do
    not_a_place = Destination.create(name: 'Fake place',
                                    zip: '12345',
                                    description: 'This place is not real',
                                    image_url: Faker::Placeholdit.image)

    visit root_path

    within ".destination-#{not_a_place.id}" do
      click_link "Show"
    end

    expect(current_path).to eq destination_path(not_a_place.id)

    expect(page).to have_content not_a_place.name
    expect(page).to have_content not_a_place.zip
    expect(page).to have_content not_a_place.description

    within ".weather" do
      expect(page).to have_css(".date")
      expect(page).to have_css(".current")
      expect(page).to have_css(".high")
      expect(page).to have_css(".low")
      expect(page).to have_css(".summary")
      expect(page).to have_content('unavailable', count: 5)
    end
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
