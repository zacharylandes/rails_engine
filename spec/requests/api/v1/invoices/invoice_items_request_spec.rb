require "rails_helper"

describe "Merchant Invoices Search API" do
 let!(:merchant) {create(:merchant)}
 let!(:customer) {create(:customer)}
 let!(:item) {create(:item, merchant_id: merchant.id)}
 let!(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id)}
 let!(:invoice_item) {create(:invoice_item, item_id: item.id, invoice_id: invoice.id)}
 let!(:invoice_item_2) {create(:invoice_item, item_id: item.id, invoice_id: invoice.id)}
 let!(:invoice_item_3) {create(:invoice_item, item_id: item.id, invoice_id: invoice.id)}
  context "HTTP GET" do
    it "can return all of an invoices invoice_items by invoice id" do

     get "/api/v1/invoices/#{invoice.id}/invoice_items"

      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
      expect(invoice_items[0]["id"]).to eq invoice_item.id
    end
  end
end