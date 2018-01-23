require 'rails_helper'

describe "Customers API" do 
  context "HTTP GET" do 
    it "returns all customers" do
      create_list(:customer, 10)

      get '/api/v1/customers'

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers.count).to eq 10
      expect(customers.class).to eq Array
      expect(response.class).to eq ActionDispatch::TestResponse
      expect(response.body.class).to eq String
    end
  end

end