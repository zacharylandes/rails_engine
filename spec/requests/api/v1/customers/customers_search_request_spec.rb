require "rails_helper"

describe "Customer Search API" do 
  context "HTTP GET to Search Controller" do 
    before :each do 
      @timo_merchants = create_list(:customer, 10, first_name: "Timo")
      @landes_merchants = create_list(:customer, 5, last_name: "Landes")
    end
    it "can find all customers via passing in params" do

      get '/api/v1/customers/find_all?first_name=Timo'
      customers = JSON.parse(response.body)
      expect(response).to be_successful
      expect(customers.count).to eq 10
    end
     it "can find all customers via passing in different params" do

      get '/api/v1/customers/find_all?last_name=Landes'
      customers = JSON.parse(response.body)
      expect(response).to be_successful
      expect(customers.count).to eq 5
    end
     it "can find a single customer via passing in params" do

      zack = create(:customer, first_name: "Zack")
      get '/api/v1/customers/find?first_name=Zack'
      customers = JSON.parse(response.body)
      expect(response).to be_successful
      expect(customers.class).to eq Hash
      expect(customers["id"]).to eq zack.id
    end
  end
end