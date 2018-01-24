require "rails_helper"

describe "Invoice transaction Search API" do
    let(:merchant) {create(:merchant)}
    let(:customer) {create(:customer)}
    let(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id)}
  context "HTTP GET" do
    it "can return all of an invoices transactions via invoice id" do

     get "/api/v1/invoices/#{invoice.id}/customer"

      customers = JSON.parse(response.body)
      expect(response).to be_successful
      expect(customers['id']).to eq customer.id
      expect(customers['first_name']).to eq customer.first_name
    end
  end
end