require "rails_helper"

describe "Merchant Items Search API" do
  before (:each) do
    @merchant = create(:merchant)
    create_list(:item, 4, merchant_id: @merchant.id)
end
  context "HTTP GET" do
    it "can return allof a merchants items via merchant id" do

     get "/api/v1/merchants/#{@merchant.id}/items"

      items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(items.count).to eq(4)
    end
  end
end