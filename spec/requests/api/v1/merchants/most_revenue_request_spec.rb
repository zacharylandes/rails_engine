require "rails_helper"

describe "Merchant most revenue" do
  before (:each) do
    customer = create(:customer)
    create_list(:merchant,10)
    create_list(:item, 4, merchant_id: Merchant.first.id)
    create_list(:item, 23, merchant_id: Merchant.last.id)
    create_list(:invoice, 4, merchant_id: Merchant.first.id, customer_id: customer.id)
    create_list(:invoice, 10, merchant_id: Merchant.last.id, customer_id: customer.id)
    create_list(:invoice_item, 10, invoice_id:Invoice.first.id, item_id: Item.first.id)
    create_list(:invoice_item, 10, invoice_id:Invoice.last.id, item_id: Item.last.id)

  end
  context "HTTP GET" do
    it "can return top x merchants by most revenue" do

     get "/api/v1/merchants/most_revenue?quantity=1"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.count).to eq(1)
    end
    it "can return top x merchants by number of items sold" do 

      get "/api/v1/merchants/most_items?quantity=1"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.count).to eq(1)
    end
  end
end