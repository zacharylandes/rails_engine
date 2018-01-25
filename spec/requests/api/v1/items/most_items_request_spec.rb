require "rails_helper"

describe "Item best day api" do
  let!(:merchant) {create(:merchant)}
  let!(:item){create(:item, merchant_id: merchant.id)}
 let!(:customer) {create(:customer)}
 let!(:invoice) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id,created_at:'2012-02-12')}
 let!(:invoice2) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id,created_at:'2012-03-12')}
 let!(:invoice3) {create(:invoice, merchant_id: merchant.id, customer_id: customer.id,created_at:'2012-04-12')}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice.id)}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice.id)}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice2.id)}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice2.id)}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice3.id)}
 let!(:invoice_item){create(:invoice_item, item_id: item.id, invoice_id: invoice3.id)}
 let!(:transaction) {create(:transaction, invoice_id: invoice.id, result: 'success')}
 let!(:transaction) {create(:transaction, invoice_id: invoice.id, result: 'success')}
 let!(:transaction) {create(:transaction, invoice_id: invoice2.id, result: 'failed')}
 let!(:transaction) {create(:transaction, invoice_id: invoice3.id, result: 'failed')}
 let!(:transaction) {create(:transaction, invoice_id: invoice3.id, result: 'success')}


  context "HTTP GET" do
    it "can return an items best day" do

     get "/api/v1/items/most_items?quantity=1"

      day = JSON.parse(response.body)
      expect(response).to be_successful
      expect(day.length).to eq 1
      expect(day.class).to eq Array
      expect(day[0]["merchant_id"]).to eq merchant.id
      expect(day[0]["item_count"]).to eq 1
    end
  end
end
