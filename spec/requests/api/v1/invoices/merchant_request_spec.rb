require "rails_helper"

describe "Invoice merchant Search API" do
    let(:merchant) {create(:merchant)}
    let(:customer) {create(:customer)}
    let(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id)}
  context "HTTP GET" do
    it "can return an invoices merchant via invoice id" do

     get "/api/v1/invoices/#{invoice.id}/merchant"

      merchant_response = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchant_response['id']).to eq merchant.id
      expect(merchant_response['name']).to eq merchant.name
    end
  end
end