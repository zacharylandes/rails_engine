  require "rails_helper"

describe "single merchant by date" do
  let!(:merchant_1) { create(:merchant, name: "sony") }
  let!(:merchant_2) { create(:merchant, name: "apple") }
  let!(:item) {create(:item, merchant_id: merchant_1.id)}
  let!(:item_2) {create(:item, merchant_id: merchant_2.id)}
  
  before (:each) do
    customer = create(:customer)
    merchant_1_invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id, updated_at: "2012-04-16")
    merchant_1_invoice_1 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id, updated_at: "2012-04-16")
    merchant_2_invoice_1 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id, updated_at: "2012-04-16")
    merchant_2_invoice_2 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id, updated_at: "2012-04-16")
    create(:invoice_item, invoice_id: merchant_1_invoice_2.id, item_id: item_2.id, unit_price: 10, quantity: 1)
    create(:invoice_item, invoice_id: merchant_1_invoice_1.id, item_id: item.id, unit_price: 10, quantity: 1)
    create(:invoice_item, invoice_id: merchant_2_invoice_1.id, item_id: item.id, unit_price: 100, quantity: 1)
    create(:invoice_item, invoice_id: merchant_2_invoice_2.id, item_id: item.id, unit_price: 100, quantity: 1)
    create(:transaction, invoice_id: merchant_1_invoice_1.id, result: "success")
    create(:transaction, invoice_id: merchant_2_invoice_1.id, result: "success")
    create(:transaction, invoice_id: merchant_2_invoice_1.id, result: "failure")
    create(:transaction, invoice_id: merchant_1_invoice_2.id, result: "success")
    create(:transaction, invoice_id: merchant_1_invoice_2.id, result: "failure")
  end
  context "HTTP GET" do
    it "can return single merchant revenue by date" do

     get "/api/v1/merchants/#{merchant_1.id}/revenue?date=2012-04-16"

      revenue = JSON.parse(response.body)
      expect(response).to be_successful
      expect(revenue).to eq({"revenue"=>"0.2"})
    end
  end
end