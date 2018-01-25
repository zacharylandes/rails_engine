require 'rails_helper'

describe "Items API" do
  before(:each) do
    create_list(:merchant, 3)
    create_list(:item, 3, merchant_id: Merchant.first.id)
  end
  it "sends a list of items" do

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(Item.count).to eq(3)

    expect(response).to be_success
  end

  it "shows a single item" do

    get "/api/v1/items/#{Item.first.id}"

    show_item = JSON.parse(response.body)


    expect(Item.first.name).to eq(show_item['name'])
  end

  it "shows a random item" do
    get "/api/v1/items/random"

    random = JSON.parse(response.body)

    expect(random.class).to eq(Hash)
    expect(response).to be_success

  end

end
