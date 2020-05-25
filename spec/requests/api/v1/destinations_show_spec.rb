require 'rails_helper'

describe "destination API" do
  it 'can see a single destination' do
    create_list(:destination, 4)
    tlh = Destination.create(name: 'Tallahassee',
                             zip: '32317',
                             description: 'Near the Florida Georgia Line',
                             image_url: Faker::Placeholdit.image)

    get "/api/v1/destinations/#{tlh.id}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json[:id]).to eq(tlh.id)
    expect(json[:name]).to eq(tlh.name)
  end
end
