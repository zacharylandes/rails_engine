require "rails_helper"

describe "Merchant Invoices Search API" do
 let!(:merchant) {create(:merchant)}
 let!(:customer) {create(:customer)}
 let!(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id)}
 let!(:invoice_2) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id)}
 let!(:invoice_3) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id)}
  context "HTTP GET" do
    it "can return all of a merchants invoices via merchant id" do

     get "/api/v1/merchants/#{merchant.id}/invoices"

      invoices = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoices.count).to eq(3)
      expect(invoices[0]["id"]).to eq invoice.id
    end
  end
end