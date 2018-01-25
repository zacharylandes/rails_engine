class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.top_revenue_earners(quantity=1)
    select('merchants.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue').
    joins(:invoices => [:invoice_items, :transactions]).
    merge(Transaction.success).
    group("merchants.id").
    order("revenue DESC").
    limit(quantity)
  end

  def self.top_merchants_by_items_sold(quantity)
    Merchant.select('merchants.*, sum(invoice_items.quantity) as items_count').
    joins(:invoices => [:invoice_items, :transactions]).
    merge(Transaction.success).
    group(:id).
    order("items_count DESC").
    limit(quantity)
  end

  def single_merchant_revenue
    {'revenue' => (invoices.joins(:invoice_items, :transactions)
    .merge(Transaction.success).sum('invoice_items.quantity*invoice_items.unit_price')/100)}
  end

  def single_merchant_revenue_by_date(date)
    d = DateTime.parse(date)
    {'revenue' => (invoices.joins(:invoice_items, :transactions)
    .merge(Transaction.success)
    .where('invoices.updated_at' => d.beginning_of_day..d.end_of_day)
    .sum('invoice_items.quantity*invoice_items.unit_price')/100)}
  end

  def favorite_customer
    self.customers.joins(:transactions, :invoices).merge(Transaction.success).group('customers.id').order('count(transactions) desc').limit(1).first
  end
end
