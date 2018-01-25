class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions

  has_many :invoice_items
  has_many :items, through: :invoice_items

     def self.revenue_by_date(date)
      d = DateTime.parse(date)
      revenue = joins(:invoice_items, :transactions).
      merge(Transaction.success).
      where('invoices.updated_at' => d.beginning_of_day..d.end_of_day).
      sum('invoice_items.quantity* (invoice_items.unit_price)').to_f
      {"total_revenue"=> "#{revenue/100}"}
    end

    def self.top_revenue_earners(quantity=1)
      select('merchants.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue').
      joins(:invoice_items, :transactions).
      merge(Transaction.success).
      group("merchants.id").
      order("revenue DESC").
      limit(quantity)
   end




end
