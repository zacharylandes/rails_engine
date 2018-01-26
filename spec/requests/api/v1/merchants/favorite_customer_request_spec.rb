  require "rails_helper"

describe "merchant favorite customer" do
  let!(:merchant_1) { create(:merchant, name: "sony") }
  let!(:merchant_2) { create(:merchant, name: "apple") }
  let!(:customer) {create(:customer)}
  let!(:customer_2) {create(:customer)}
  let!(:item) {create(:item, merchant_id: merchant_1.id)}
  let!(:item_2) {create(:item, merchant_id: merchant_2.id)}
  
  before (:each) do
    merchant_1_invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    merchant_1_invoice_1 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    merchant_2_invoice_1 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer_2.id)
    merchant_2_invoice_2 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer_2.id)
    create(:invoice_item, invoice_id: merchant_1_invoice_2.id, item_id: item.id, unit_price: 10, quantity: 1, created_at: "2012-04-16")
    create(:invoice_item, invoice_id: merchant_1_invoice_1.id, item_id: item_2.id, unit_price: 10, quantity: 1, created_at: "2012-04-16")
    create(:invoice_item, invoice_id: merchant_2_invoice_1.id, item_id: item_2.id, unit_price: 100, quantity: 1, created_at: "2012-04-16")
    create(:invoice_item, invoice_id: merchant_2_invoice_2.id, item_id: item_2.id, unit_price: 100, quantity: 1, created_at: "2012-04-16")
    create(:transaction, invoice_id: merchant_1_invoice_1.id, result: "success")
    create(:transaction, invoice_id: merchant_2_invoice_1.id, result: "success")
    create(:transaction, invoice_id: merchant_1_invoice_2.id, result: "failure")
    create(:transaction, invoice_id: merchant_1_invoice_2.id, result: "failure")
  end
  context "HTTP GET" do
    it "can return single merchant revenue by date" do

     get "/api/v1/merchants/#{merchant_1.id}/favorite_customer"

      favorite_customer = JSON.parse(response.body)
      expect(response).to be_successful
      expect(favorite_customer["id"]).to eq(customer.id)
    end
  end
end