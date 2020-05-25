require 'rails_helper'

describe "destination API" do
  it 'can see all destinations' do
    create_list(:destination, 4)
    tlh = Destination.create(name: 'Tallahassee',
                             zip: '32317',
                             description: 'Near the Florida Georgia Line',
                             image_url: Faker::Placeholdit.image)

    get '/api/v1/destinations'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.last).to have_key(:id)
    expect(json.last).to have_key(:name)
    expect(json.last).to have_key(:zip)
    expect(json.last).to have_key(:description)
    expect(json.last).to have_key(:image_url)

    expect(json.last[:id]).to eq(tlh.id)
    expect(json.last[:name]).to eq('Tallahassee')
  end
end
