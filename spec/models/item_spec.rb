require 'rails_helper'

describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'class methods' do
    it '::search_by' do
      @item1 = create(:item, created_at: 5.days.ago)
      @item2 = create(:item, created_at: 5.days.ago)
      @item3 = create(:item, created_at: 10.days.ago)
      @item4 = create(:item, created_at: 3.days.ago)
      @item5 = create(:item, created_at: 6.days.ago)

      expect(Item.search_by({'created_at' => 5.days.ago})).to eq([@item1, @item2])
    end
  end
end
