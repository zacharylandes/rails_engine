require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "relationships" do 
    it {should belong_to :invoice}
  end
  describe "scopes" do
    it "has correct scopes" do
    expect(Transaction.success).to eq Transaction.where(result: 'success')
    expect(Transaction.failure).to eq Transaction.where(result: 'failed')
    end
  end
end
