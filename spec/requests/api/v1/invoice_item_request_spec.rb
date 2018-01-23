require 'rails_helper'

describe "Invoice Items API" do
  before (:each) do

  @merchant = create(:merchant)
  @customer = create(:customer)
  @invoice = create(:invoice, customer_id: @customer.id, merchant_id:@merchant.id)
  @item = create(:item, merchant_id:@merchant.id)

  create_list(:invoice_item, 3, invoice_id: @invoice.id, item_id: @item.id)
end
  it "sends a list of invoices items" do

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
    expect(response).to be_success
  end



  it "shows a single invoice item" do


    invoice = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)

    get "/api/v1/invoices/#{invoice.id}"

    show_invoice = JSON.parse(response.body)

    expect(invoice.status).to eq(show_invoice['status'])
  end

end
