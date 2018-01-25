class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    select('items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue').
    joins(:invoice_items).group('items.id').order('revenue DESC').limit(quantity)
  end

  def best_day
    day = invoices.joins(:invoice_items).select('invoices.created_at, SUM(invoice_items.quantity) AS CREATED_COUNT').group('invoices.created_at').order(' CREATED_COUNT DESC').limit(1).first.created_at
    {'best_day' => day}
  end
end
