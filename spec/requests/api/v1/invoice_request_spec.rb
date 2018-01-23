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
  #
  it "can create a new invoice" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_params = { customer_id: customer.id, merchant_id: merchant.id, status: "fail"}

    post "/api/v1/invoices", params: {invoice: invoice_params}
    invoice = Invoice.last

    assert_response :success
    expect(response).to be_success
    expect(invoice.status).to eq(invoice_params[:status])
  end

  it "can update an invoice" do
    merchant = create(:merchant )
    customer = create(:customer)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

    old_status = invoice.status
    invoice_params = { customer_id: customer.id, merchant_id: merchant.id, status: "fail"}

    put "/api/v1/invoices/#{invoice.id}", params: {invoice: invoice_params}
    invoice = Invoice.last

    assert_response :success
    expect(response).to be_success
    expect(invoice.status).to_not eq(old_status)
    expect(invoice.status).to eq(invoice_params[:status])
  end

  it "can delete an invoice" do
    merchant = create(:merchant )
    customer = create(:customer)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

    delete "/api/v1/invoices/#{invoice.id}"

    assert_response :success
    expect(response).to be_success
    expect(Invoice.count).to eq(0)
  end
end
