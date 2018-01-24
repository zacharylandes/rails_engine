class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices


  def self.top_revenue_earners(quantity=1)
    Merchant.select('merchants.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue').
    joins(:invoice_items).
    group("merchants.id").
    order("revenue DESC").
    limit(quantity)
  end

  def self.top_merchants_by_items_sold(quantity=1)
    Merchant.select('merchants.*, count(items) as items_count').
    joins(:items).
    joins(:transactions).
    group("merchants.id").
    order("items_count DESC").
    limit(quantity)
  end

  def self.revenue_by_date(date)
    Merchant.
    joins(:invoice_items).
    where("date(invoice_items.created_at) = ?",  date).
    sum('invoice_items.quantity*invoice_items.unit_price')
  end

end
