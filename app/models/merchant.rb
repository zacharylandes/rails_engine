class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices


  def self.top_revenue_earners(quantity)
    Merchant.select('merchants.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue').
    joins(:invoice_items).
    group("merchants.id").
    order("revenue DESC").
    limit(quantity)
  end

  def self.top_merchants_by_items_sold(quantity)
    Merchant.select('merchants.*, count(items) as items_count').
    joins(:items).
    joins(:transactions).
    where("transactions.result": "success").
    group("merchants.id").order("items_count DESC").
    limit(quantity)
  end

  def self.revenue_by_date(date)
    Merchant.select('merchants.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue').
    joins(:invoice_items).
    where("date(invoice_items.created_at) = ?",  date).
    group("merchants.id").
    order("revenue DESC")
  end

end
