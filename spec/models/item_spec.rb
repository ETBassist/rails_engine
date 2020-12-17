require 'rails_helper'

describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
  end

  describe 'class methods' do
    before :each do
      @item1 = create(:item, created_at: 5.days.ago)
      @item2 = create(:item, created_at: 5.days.ago)
      @item3 = create(:item, created_at: 10.days.ago)
      @item4 = create(:item, created_at: 3.days.ago)
      @item5 = create(:item, created_at: 6.days.ago)
    end

    it '::search_for_many' do
      expect(Item.search_for_many({'created_at' => 5.days.ago})).to eq([@item1, @item2])
    end

    it '::search_for_one' do
      expect(Item.search_for_one({'created_at' => 5.days.ago})).to eq(@item1)
    end
  end
end
