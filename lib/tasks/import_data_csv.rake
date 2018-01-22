require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
  Customer.destroy_all
  Transaction.destroy_all
  Merchant.destroy_all
  Item.destroy_all
  Invoice.destroy_all
  InvoiceItem.destroy_all

    CSV.foreach('data/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
    CSV.foreach('data/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
    CSV.foreach('data/items.csv', :headers => true) do |row|
      Item.create!(row.to_hash)
    end
    CSV.foreach('data/invoices.csv', :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
    CSV.foreach('data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
    CSV.foreach('data/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
end
