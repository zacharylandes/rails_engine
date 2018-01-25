require 'rails_helper'

describe "Customers API" do
  before(:each) do
    create_list(:customer, 10)
  end
  context "HTTP GET" do
    it "returns all customers" do

      get '/api/v1/customers'

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers.count).to eq 10
      expect(customers.class).to eq Array
      expect(response.class).to eq ActionDispatch::TestResponse
      expect(response.body.class).to eq String
    end
  end
   it "can get one customer by id" do
      customer_factory = create(:customer)


      get "/api/v1/customers/#{customer_factory.id}"

      expect(response).to be_successful
      customer = JSON.parse(response.body)

      expect(customer.class).to eq Hash
      expect(customer["id"]).to eq customer_factory.id
      expect(customer["first_name"]).to eq customer_factory.first_name
      expect(customer["last_name"]).to eq customer_factory.last_name
    end

     it "can get one customer by random" do

        get "/api/v1/customers/random"

        expect(response).to be_successful
        customer = JSON.parse(response.body)

        expect(customer.class).to eq Hash
      end
end
