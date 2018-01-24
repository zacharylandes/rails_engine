require 'rails_helper'

describe "Transaction Search API" do
  context "HTTP GET in namespaced Transaction Search Controller" do
    let!(:customer) {create(:customer)}
    let!(:merchant) {create(:merchant)}
    let!(:invoice) {create(:invoice, customer_id: customer.id, merchant_id: merchant.id)}
    let!(:transaction) {create(:transaction, invoice_id: invoice.id, credit_card_number: 100, result: "pending")}

    it "can find a transactions invoice " do

      get "/api/v1/transactions/#{transaction.id}/invoice"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice.class).to eq Hash
    end

  end
end
