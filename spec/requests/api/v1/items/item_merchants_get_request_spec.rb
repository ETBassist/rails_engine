require 'rails_helper'

describe 'Item Relationship GET endpoint' do
  before :each do
    @item = create(:item)
    @merchant = @item.merchant
  end

  it 'I see information for an items merchant' do
    get "/api/v1/items/#{@item.id}/merchants" 

    merchant_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchant_response[:data][:id]).to eq("#{@merchant.id}")
    expect(merchant_response[:data][:type]).to eq('merchant')
    expect(merchant_response[:data][:attributes][:name]).to eq(@merchant.name)
  end
end
