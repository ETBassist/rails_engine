require 'rails_helper'

describe 'Merchant/Items index GET request' do
  before :each do
    @merchant = create(:merchant)
    @merchant2 = create(:merchant)
    create_list(:item, 10, merchant_id: @merchant.id)
    create_list(:item, 5, merchant_id: @merchant2.id)
  end

  it 'I can see all the items for a merchant with GET /api/v1/merchants/:id/items' do
    get "/api/v1/merchants/#{@merchant.id}/items"

    items_response = JSON.parse(response.body, symbolize_names: true)
    expect(items_response[:data]).to be_a(Array)
    expect(items_response[:data].size).to eq(10)
    items_response[:data].each do |item|
      expect(item).to have_key(:id)
      expect(item[:type]).to eq('item')
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:merchant_id]).to eq(@merchant.id)
    end
  end
end
