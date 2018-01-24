require "rails_helper"

describe "Item Invoice_items Search API" do
  let!(:merchant) {create(:merchant)}
  let!(:item){create(:item, merchant_id: merchant.id)}

  before (:each) do
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:invoice_item, 3, invoice_id: invoice.id, item_id: item.id)
end
  context "HTTP GET" do
    it "can return allof an items invoice items via item id" do

     get "/api/v1/items/#{item.id}/invoice_items"

      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
    end
  end
end
