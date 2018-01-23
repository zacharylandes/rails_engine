require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:merchant, 3)
    create_list(:item, 3, merchant_id: Merchant.first.id)

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)

    expect(response).to be_success
  end

  it "shows a single item" do

    merchant = create(:merchant )
    item = create(:item, merchant_id:merchant.id)

    get "/api/v1/items/#{item.id}"

    show_item = JSON.parse(response.body)


    expect(item.name).to eq(show_item['name'])
  end

  it "can create a new item" do
    merchant = create(:merchant )
    item_params = { name: "Saw", description: "I want to play a game", unit_price: 99.99, merchant_id: merchant.id }

    post "/api/v1/items", params: {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])
  end

  it "can update an item" do
    merchant = create(:merchant )
    item = create(:item, merchant_id:merchant.id)
    old_name = item.name
    item_params = { name: "Saw", description: "I want to play a game", unit_price: 99.99, merchant_id: merchant.id }

    put "/api/v1/items/#{item.id}", params: {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to_not eq(old_name)
    expect(item.name).to eq(item_params[:name])

  end

  it "can delete an item" do
    merchant = create(:merchant )
    item = create(:item, merchant_id:merchant.id)

    delete "/api/v1/items/#{item.id}"

    assert_response :success
    expect(response).to be_success
    expect(Item.count).to eq(0)
  end
end
