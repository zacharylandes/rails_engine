require "rails_helper"

describe "Invoice item Search API" do
  before (:each) do

  @merchant = create(:merchant)
  @customer = create(:customer)
  @invoice = create(:invoice, customer_id: @customer.id, merchant_id:@merchant.id)
  @item = create(:item, merchant_id:@merchant.id)

  create_list(:invoice_item, 3, invoice_id: @invoice.id, item_id: @item.id)
end
  context "HTTP GET" do
    it "can return allof a invoices transactions via invoice id" do

     get "/api/v1/invoices/#{@invoice.id}/items"

      items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(items.count).to eq(1)
    end
  end
end