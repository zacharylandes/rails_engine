require 'rails_helper'

describe "Transactions API" do
  context "HTTP GET" do

    it "returns all transactions" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      create_list(:transaction, 10, invoice_id: invoice.id)

      get '/api/v1/transactions'

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq 10
      expect(transactions.class).to eq Array
      expect(response.class).to eq ActionDispatch::TestResponse
      expect(response.body.class).to eq String
    end

    it "can get one transaction by id" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      transaction_factory = create(:transaction, invoice_id: invoice.id)

      get "/api/v1/transactions/#{transaction_factory.id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction.class).to eq Hash
      expect(transaction["id"]).to eq transaction_factory.id
      expect(transaction["invoice_id"]).to eq transaction_factory.invoice_id
    end

    it "can get a random transaction " do

      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      transaction_factory = create(:transaction, invoice_id: invoice.id)


      get "/api/v1/transactions/random"

      expect(response).to be_successful

      random = JSON.parse(response.body)

      expect(random.class).to eq Hash
    end
  end
end
