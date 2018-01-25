class MerchantSerializer < ActiveModel::Serializer
    attributes :id, :name

    # has_many :invoices, serializer: InvoiceSerializer

end
