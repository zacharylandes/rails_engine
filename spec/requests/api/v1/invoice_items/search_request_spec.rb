require 'rails_helper'

describe "Invoice Item Search API" do
  before (:each) do
  @merchant = create(:merchant)
  @customer = create(:customer)
  @invoice = create(:invoice, customer_id: @customer.id, merchant_id:@merchant.id)
  @item = create(:item, merchant_id:@merchant.id)

  create_list(:invoice_item, 3, invoice_id: @invoice.id, item_id: @item.id)
end
  context "HTTP GET" do
    it "can return all invoice items via id" do

      get "/api/v1/invoice_items/find_all?id=#{InvoiceItem.last.id}"

      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.count).to eq(1)
    end

    it "can return a single invoice item via id" do

      get "/api/v1/invoice_items/find?id=#{InvoiceItem.last.id}"

      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.class).to eq Hash

    end

    xit "can return a single invoice item via date" do

      get "/api/v1/invoice_items/find?created_at=#{InvoiceItem.last.created_at.to_s}"
      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.class).to eq Array

    end


  end
end
