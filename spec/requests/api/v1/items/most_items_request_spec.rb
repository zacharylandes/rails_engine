require "rails_helper"

describe "Item best day api" do
  let!(:merchant) {create(:merchant)}
  let!(:item){create(:item, merchant_id: merchant.id)}
 let!(:customer) {create(:customer)}
 let!(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id,created_at:'2012-02-12')}
 let!(:invoice2) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id,created_at:'2012-03-12')}
 let!(:invoice3) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id,created_at:'2012-04-12')}

 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice.id)}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice2.id)}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice3.id)}


  context "HTTP GET" do
    it "can return an items best day" do

     get "/api/v1/items/#{item.id}/most_items?quantity=2"

      day = JSON.parse(response.body)
      expect(response).to be_successful
      expect(day).to eq
    end
  end
end
