require 'rails_helper'

describe "Merchant Search API" do
  context "HTTP GET" do
    it "can return all merchants via search" do

      create_list(:merchant, 5, name: "timo")

      get '/api/v1/merchants/find_all?name=timo'

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.count).to eq 5
    end
     it "can return all merchants via search" do

      merchant = create(:merchant)

      get "/api/v1/merchants/find_all?id=#{merchant.id}"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.class).to eq Array
      expect(merchants.count).to eq 1
    end
    it "can return all merchants via search" do

      merchant = create(:merchant)

      get "/api/v1/merchants/find?id=#{merchant.id}"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.class).to eq Hash

    end
    it "can return all merchants via search" do

      merchant = create(:merchant, name: "zack")
      merchant_2 = create(:merchant, name: "zack")

      get "/api/v1/merchants/find?name=#{merchant.name}"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.class).to eq Hash
      expect(merchants["id"]).to eq merchant.id

    end
  end
end
