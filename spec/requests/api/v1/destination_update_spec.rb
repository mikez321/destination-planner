require 'rails_helper'

describe "destination API" do
  it 'can edit destinations' do
    create_list(:destination, 4)
    tlh = Destination.create(name: 'Tallahassee',
                             zip: '32317',
                             description: 'Near the Florida Georgia Line',
                             image_url: Faker::Placeholdit.image)

    old_description = tlh.description

    update_params = {description: "Swimmin' Pools, Huntin', Trucks"}

    patch "/api/v1/destinations/#{tlh.id}", params: {destination: update_params}

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_an(Hash)
    expect(json[:name]).to eq("Tallahassee")
    expect(json[:description]).to eq("Swimmin' Pools, Huntin', Trucks")
    expect(json[:description]).to_not eq(old_description)
  end
end
