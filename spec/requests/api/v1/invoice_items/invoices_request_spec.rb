require 'rails_helper'

describe "InvoiceItems Invoice Search API" do
    let(:merchant) {create(:merchant)}
    let(:merchant_2) {create(:merchant)}
    let(:customer) {create(:customer)}
    let(:customer_2) {create(:customer)}
    let(:item) {create(:item, merchant_id: merchant.id)}
    let(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id)}
    let(:invoice_2) {create(:invoice, merchant_id: merchant_2.id, customer_id: customer_2.id)}
    let(:invoice_3) {create(:invoice, merchant_id: merchant_2.id, customer_id: customer_2.id)}
    let(:invoice_item) {create(:invoice_item, item_id: item.id, invoice_id: invoice.id)}

  context "HTTP GET" do
    it "can return an invoice_item's invoice by invoice_item id" do

     get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      invoices = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoices['id']).to eq invoice.id
      expect(invoices['customer_id']).to eq customer.id
      expect(invoices['merchant_id']).to eq merchant.id
    end
  end
end