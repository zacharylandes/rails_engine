require 'rails_helper'

describe "Item Search API" do
  before (:each) do
    @merchant = create(:merchant)
    create_list(:item, 4, merchant_id: @merchant.id)
end
  context "HTTP GET" do
    it "can return all items via id" do

      get "/api/v1/items/find_all?merchant_id=#{Item.last.merchant_id}"
      items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(items.count).to eq(4)
    end

    it "can return a single invoice  via id" do

      get "/api/v1/items/find?id=#{Item.last.id}"

      invoice = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice.class).to eq Hash

    end

    xit "can return a single invoice  via date" do
      item = Item.create(id: 1368,
      name: "Item Deserunt Dicta",
      description: "Rem quos non dolores sit. Est facilis error ab adipisci consequuntur quo et. Vel error eos.",
      unit_price: "274.09",
      merchant_id: 59,
      created_at: "2012-03-27T14:54:05.000Z",
      updated_at: "2012-03-27T14:54:05.000Z")

      get "/api/v1/items/find?created_at=2012-03-27T14:54:05.000Z"

      items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(items.class).to eq Array

    end


  end
end
