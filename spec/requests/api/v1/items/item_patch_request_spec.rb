require 'rails_helper'

describe 'Item PATCH endpoint' do
  before :each do
    merchant = create(:merchant)
    @item = Item.create(
      name: Faker::Coffee.blend_name,
      description: Faker::Coffee.notes,
      unit_price: 12.99,
      merchant_id: merchant.id
    )
  end

  it 'I can send a PATCH request to /api/v1/items/:id to update an item' do
    item_params = { name: 'Wind and Sea',
                    unit_price: 24.99 }

    patch "/api/v1/items/#{@item.id}", params: item_params

    item_response = JSON.parse(response.body, symbolize_names: true)

    expect(item_response[:data][:id]).to eq("#{@item.id}")
    expect(item_response[:data][:type]).to eq('item')
    expect(item_response[:data][:attributes][:name]).to eq(item_params[:name])
    expect(item_response[:data][:attributes][:unit_price]).to eq(item_params[:unit_price])

    expect(@item.reload.name).to eq(item_params[:name])
    expect(@item.reload.unit_price).to eq(item_params[:unit_price])
  end

  it 'I get a 400 bad request status if I send an empty required field' do
    bad_item_params = { name: '',
                        unit_price: 24.99 }

    patch "/api/v1/items/#{@item.id}", params: bad_item_params

    expect(response.status).to eq(400)
  end
end
