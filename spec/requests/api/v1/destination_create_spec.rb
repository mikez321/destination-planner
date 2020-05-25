require 'rails_helper'

describe "destination API" do
  it 'can create destinations' do
    create_list(:destination, 4)

    expect(Destination.all.length).to eq(4)

    destination_params = {name: "Tallahassee",
                          zip: "32317",
                          description: "Near the Florida Georgia Line",
                          image_url: Faker::Placeholdit.image}

    post "/api/v1/destinations/", params: {destination: destination_params}

    expect(response).to be_successful

    expect(Destination.all.length).to eq(5)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_an(Hash)
    expect(json[:name]).to eq("Tallahassee")
  end
end
