require "rails_helper"

describe "Merchant most revenue" do
  let!(:merchant_1) { create(:merchant, name: "sony") }
  let!(:merchant_2) { create(:merchant, name: "apple") }
  
  before (:each) do
    customer = create(:customer)
    create_list(:item, 4, merchant_id: merchant_1.id)
    create_list(:item, 10, merchant_id: merchant_2.id)
    merchant_1_invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    merchant_1_invoice_1 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    merchant_2_invoice_1 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)
    merchant_2_invoice_2 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)
    create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)
    create(:invoice_item, invoice_id: merchant_1_invoice_2.id, item_id: Item.first.id, unit_price: 10, quantity: 1)
    create(:invoice_item, invoice_id: merchant_1_invoice_1.id, item_id: Item.last.id, unit_price: 10, quantity: 1)
    create(:invoice_item, invoice_id: merchant_2_invoice_1.id, item_id: Item.last.id, unit_price: 100, quantity: 1)
    create(:invoice_item, invoice_id: merchant_2_invoice_2.id, item_id: Item.last.id, unit_price: 100, quantity: 1)
    create(:transaction, invoice_id: merchant_1_invoice_1.id, result: "success")
    create(:transaction, invoice_id: merchant_2_invoice_1.id, result: "success")
    create(:transaction, invoice_id: merchant_1_invoice_2.id, result: "failure")
    create(:transaction, invoice_id: merchant_1_invoice_2.id, result: "failure")
  end
  context "HTTP GET" do
    it "can return top x merchants by most revenue" do

     get "/api/v1/merchants/most_revenue?quantity=1"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.count).to eq(1)
      expect(merchants[0]["id"]).to eq merchant_2.id
    end
    it "can return top x merchants by number of items sold" do 

      get "/api/v1/merchants/most_items?quantity=1"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.count).to eq(1)
      expect(merchants[0]["id"]).to eq merchant_2.id      
    end
  end
end