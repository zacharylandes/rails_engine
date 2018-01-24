require "rails_helper"

describe "Invoice transaction Search API" do
  before (:each) do
    @merchant = create(:merchant)
    @customer = create(:customer)
    create_list(:invoice, 3, merchant_id: @merchant.id, customer_id: @customer.id)
    create_list(:transaction, 10, invoice_id: Invoice.first.id)

end
  context "HTTP GET" do
    it "can return allof a invoices transactions via invoice id" do

     get "/api/v1/invoices/#{Invoice.first.id}/transactions"

      transactions = JSON.parse(response.body)
      expect(response).to be_successful
      expect(transactions.count).to eq(10)
    end
  end
end