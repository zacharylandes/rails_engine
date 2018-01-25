class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices


   def self.pending_invoices(merchant_id)
     find_by_sql("SELECT customers.* FROM customers
       JOIN invoices ON invoices.customer_id=customers.id
       JOIN transactions  ON transactions.invoice_id = invoices.id
       WHERE invoices.merchant_id = #{merchant_id}
       AND transactions.result = 'failed'
       EXCEPT
       SELECT customers.* FROM customers
       JOIN invoices ON invoices.customer_id=customers.id
       JOIN transactions  ON transactions.invoice_id = invoices.id
       WHERE invoices.merchant_id = #{merchant_id}
       AND transactions.result = 'success'")
  end
end
