require 'rails_helper'

describe "Merchants API" do
  before(:each) do
    create_list(:merchant, 10)
  end
  context "HTTP GET" do
    it "returns all merchants" do

      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq 10
      expect(merchants.class).to eq Array
      expect(response.class).to eq ActionDispatch::TestResponse
      expect(response.body.class).to eq String
    end
    it "can get one merchant by id" do
      merchant_factory = create(:merchant)


      get "/api/v1/merchants/#{merchant_factory.id}"

      expect(response).to be_successful
      merchant = JSON.parse(response.body)

      expect(merchant.class).to eq Hash
      expect(merchant["id"]).to eq merchant_factory.id
      expect(merchant["name"]).to eq merchant_factory.name
    end
    it "returns a radom merchant" do

      get '/api/v1/merchants/random'

      expect(response).to be_successful
      random = JSON.parse(response.body)
      expect(random.class).to eq Hash
    end
  end
end
