require 'rails_helper'

describe "destination API" do
  it 'can delete a destination' do
    create_list(:destination, 4)
    tlh = Destination.create(name: "Tallahassee",
                             zip: "32317",
                             description: "Near the Florida Georgia Line",
                             image_url: Faker::Placeholdit.image)

    expect(Destination.all.length).to eq(5)

    delete "/api/v1/destinations/#{tlh.id}"

    expect(response).to be_successful

    expect(Destination.all.length).to eq(4)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_an(Hash)
    expect(json[:name]).to eq("Tallahassee")
  end
end
