require "rails_helper"

describe "Item merchant Search API" do
  let!(:merchant) {create(:merchant)}
  let!(:item){create(:item, merchant_id: merchant.id)}

  context "HTTP GET" do
    it "can return an items merchant" do

     get "/api/v1/items/#{item.id}/merchant"

      merchant = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchant.class).to eq Hash
    end
  end
end
