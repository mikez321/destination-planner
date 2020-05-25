require 'rails_helper'

describe "destination API" do
  it 'can also see weather at that destination' do
    create_list(:destination, 4)
    tlh = Destination.create(name: 'Tallahassee',
                             zip: '32317',
                             description: 'Near the Florida Georgia Line',
                             image_url: Faker::Placeholdit.image)

    get "/api/v1/destinations/#{tlh.id}/weather"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json[:data][:cityName]).to eq(tlh.name)
    expect(json[:data]).to have_key(:weather)
    expect(json[:data]).to have_key(:main)
    expect(json[:data]).to have_key(:wind)
    expect(json[:data]).to have_key(:rain)
    expect(json[:data]).to have_key(:image)
  end
end
