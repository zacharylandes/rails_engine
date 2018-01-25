require 'rails_helper'

describe "Invoice Item Search API" do
  let(:merchant) {create(:merchant)}
  let(:customer) {create(:customer)}
  let(:invoice) {create(:invoice, customer_id: customer.id, merchant_id: merchant.id)}
  let(:invoice_2) {create(:invoice, customer_id: customer.id, merchant_id: merchant.id)}
  let(:item) {create(:item, merchant_id: merchant.id)}
  let(:invoice_item) {create(:invoice_item, invoice_id: invoice_2.id, item_id: item.id)}
  before (:each) do
  create_list(:invoice_item, 3, invoice_id: invoice.id, item_id: item.id, updated_at: "2013-04-05")
end
  context "HTTP GET" do
    it "can return all invoice items via id" do

      get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"

      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
      expect(invoice_items.class).to eq Array
    end
    
    it "can return a single invoice item via id" do
      get "/api/v1/invoice_items/find?invoice_id=#{invoice.id}"
      
      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.class).to eq Hash
    end

    it "can return a single invoice item via date" do

      get "/api/v1/invoice_items/find?updated_at=2013-04-05"
      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.class).to eq Hash
    end
  end
end
