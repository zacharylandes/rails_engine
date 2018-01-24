require "rails_helper"

describe "Customer Search API" do
  context "HTTP GET to Search Controller" do
    let!(:customer_1){create(:customer, id: 1)}
    let!(:merchant_1){create(:merchant)}

    let!(:invoice){create(:invoice, merchant_id: merchant_1.id, customer_id:customer_1.id)}
    let!(:invoice1){create(:invoice, merchant_id: merchant_1.id, customer_id:customer_1.id)}

    it "find a customers invoices" do

      get "/api/v1/customers/#{customer_1.id}/invoices"
      invoices = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoices.count).to eq 2
    end

  end
end
