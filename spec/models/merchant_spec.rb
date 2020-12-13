require 'rails_helper' 

describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many :invoices }
    it { should have_many(:customers).through(:invoices) }
  end

  describe 'class methods' do
    before :each do
      @merchant1 = create(:merchant)
      @merchant2 = create(:merchant)
      invoice1 = create(:invoice, merchant: merchant1, status: 'shipped')
      invoice2 = create(:invoice, merchant: merchant1, status: 'shipped')
      invoice3 = create(:invoice, merchant: merchant1, status: 'pending')
      invoice4 = create(:invoice, merchant: merchant1, status: 'pending')
      invoice5 = create(:invoice, merchant: merchant2, status: 'shipped')
      invoice6 = create(:invoice, merchant: merchant2, status: 'shipped')
      invoice7 = create(:invoice, merchant: merchant2, status: 'shipped')
      invoice8 = create(:invoice, merchant: merchant2, status: 'shipped')
      create_list(:invoice_item, 2, invoice: invoice1, quantity: 1, unit_price: 2.0)
      create_list(:invoice_item, 4, invoice: invoice2, quantity: 3, unit_price: 4.0)
      create_list(:invoice_item, 4, invoice: invoice3, quantity: 11, unit_price: 4.0)
      create_list(:invoice_item, 4, invoice: invoice4, quantity: 46, unit_price: 4.0)
      create_list(:invoice_item, 10, invoice: invoice5, quantity: 40, unit_price: 11.0)
      create_list(:invoice_item, 10, invoice: invoice6, quantity: 40, unit_price: 11.0)
      create_list(:invoice_item, 10, invoice: invoice7, quantity: 40, unit_price: 11.0)
      create_list(:invoice_item, 10, invoice: invoice8, quantity: 40, unit_price: 11.0)
      create(:transaction, invoice: invoice1, result: 'success')
      create(:transaction, invoice: invoice2, result: 'success')
      create(:transaction, invoice: invoice3, result: 'success')
      create(:transaction, invoice: invoice4, result: 'failed')
      create(:transaction, invoice: invoice5, result: 'success')
      create(:transaction, invoice: invoice6, result: 'success')
      create(:transaction, invoice: invoice7, result: 'success')
      create(:transaction, invoice: invoice8, result: 'success')
    end

    it '::by_revenue' do
      expect(Merchant.by_revenue).to eq([@merchant2, @merchant1])
      expect(Merchant.by_revenue(1)).to eq([@merchant2])
    end
  end
end
