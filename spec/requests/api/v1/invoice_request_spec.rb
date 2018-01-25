require 'rails_helper'

describe "Invoice API" do
  it "sends a list of invoices" do
    merchant = create(:merchant)
    customer = create(:customer)

    create_list(:invoice, 3, merchant_id: merchant.id, customer_id: customer.id)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
    expect(response).to be_success
  end

  it "shows a single invoice" do

    merchant = create(:merchant)
    customer = create(:customer)

    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

    get "/api/v1/invoices/#{invoice.id}"

    show_invoice = JSON.parse(response.body)

    expect(invoice.status).to eq(show_invoice['status'])
  end

    it "shows a random invoice" do

      merchant = create(:merchant)
      customer = create(:customer)

      invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

      get "/api/v1/invoices/random"

      random = JSON.parse(response.body)

      expect(random.class).to eq(Hash)
    end


end
