class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status

  # belongs_to :merchant
  # has_many :items, serializer: ItemSerializer
end
