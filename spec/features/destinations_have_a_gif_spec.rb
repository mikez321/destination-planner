require 'rails_helper'

describe "visiting a destinations show page" do
  it "I see an image related to the current weather at at a destination" do
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
      expect(page).to have_css(".weather-image")
      expect(page).to_not have_content('unavailable')
    end
  end
end
