require 'rails_helper'

describe "Invoice Search API" do
  let!(:merchant) {create(:merchant)}
  let!(:customer) {create(:customer)}
  let!(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id, created_at: "2012-03-04")}
  context "HTTP GET" do
    it "can return all invoices via id" do

      get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"
      invoices = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoices.count).to eq(1)
    end

    it "can return a single invoice  via id" do

      get "/api/v1/invoices/find?id=#{invoice.id}"

      invoice = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice.class).to eq Hash

    end

    it "can return a single invoice via date" do

      get "/api/v1/invoices/find?created_at=2012-03-04"
      invoice_response = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_response.class).to eq Hash
      expect(invoice_response["id"]).to eq invoice.id
    end
  end
end
