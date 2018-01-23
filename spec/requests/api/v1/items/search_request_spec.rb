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

      get "/api/v1/items/find?created_at=#{Item.last.created_at.to_s}"

      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.class).to eq Array

    end


  end
end
