class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items

  def self.top_revenue_earners(quantity)
    binding.pry
    
  end
end
