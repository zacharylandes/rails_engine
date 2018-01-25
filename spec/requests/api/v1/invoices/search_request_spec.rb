require 'rails_helper'

describe "Invoice Search API" do
  before (:each) do
    @merchant = create(:merchant)
    @customer = create(:customer)
    create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)

end
  context "HTTP GET" do
    it "can return all invoices via id" do

      get "/api/v1/invoices/find_all?merchant_id=#{Invoice.last.merchant_id}"
      invoices = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoices.count).to eq(4)
    end

    it "can return a single invoice  via id" do

      get "/api/v1/invoices/find?id=#{Invoice.last.id}"

      invoice = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice.class).to eq Hash

    end

    it "can return a single invoice  via date" do

      get "/api/v1/invoices/find?created_at=#{Invoice.last.created_at.to_s}"
      invoice_items = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_items.class).to eq Array

    end


  end
end
