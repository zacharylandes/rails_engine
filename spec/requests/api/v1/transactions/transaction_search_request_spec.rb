require 'rails_helper'

describe "Transaction Search API" do 
  context "HTTP GET in namespaced Transaction Search Controller" do 
    before :each do
      customer = create(:customer)
      merchant = create(:merchant)
      @invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      create_list(:transaction, 10, invoice_id: @invoice.id, result: "success")
      create_list(:transaction, 5, invoice_id: @invoice.id, result: "failed")
      @transaction = create(:transaction, invoice_id: @invoice.id, credit_card_number: 100, result: "pending")
    end
    it "can find all transactions by given params" do 

      get "/api/v1/transactions/find_all?result=success"

      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.count).to eq 10
      expect(transactions.class).to eq Array
    end
    it "can find all transactions by alternate given params" do 

      get "/api/v1/transactions/find_all?result=failed"

      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.count).to eq 5
      expect(transactions.class).to eq Array
    end
    it "can find a transaction by given params" do 

      get "/api/v1/transactions/find?invoice_id=#{@invoice.id}"

      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.class).to eq Hash
      expect(transactions["invoice_id"]).to eq @invoice.id
      expect(transactions["id"]).to eq @transaction.id
      expect(transactions["credit_card_number"]).to eq "100"
      expect(transactions["result"]).to eq "pending"
    end
  end
end