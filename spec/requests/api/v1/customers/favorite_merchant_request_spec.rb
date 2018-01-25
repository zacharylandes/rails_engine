require "rails_helper"

describe "Customer Search API" do
  context "HTTP GET to favorite merchant controller" do
    let!(:customer_1){create(:customer, id: 1)}
    let!(:merchant_1){create(:merchant)}
    let!(:invoice){create(:invoice, merchant_id: merchant_1.id, customer_id:customer_1.id)}
    let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id:invoice.id)}

    let!(:transaction1){create(:transaction, invoice_id: invoice.id)}
    let!(:transaction2){create(:transaction, invoice_id: invoice.id)}

    it "find a customers favorite merchant" do

      get "/api/v1/customers/#{customer_1.id}/favorite_merchant"

      merchant = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchant).to eq 'something'
    end

  end
end
