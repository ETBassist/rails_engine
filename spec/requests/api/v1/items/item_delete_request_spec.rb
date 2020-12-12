require 'rails_helper'

describe 'Item DELETE request' do
  before :each do
    @merchant = create(:merchant)
    @item = Item.create!(
        name: Faker::Coffee.blend_name,
        description: Faker::Coffee.notes,
        unit_price: 12.99,
        merchant_id: @merchant.id
      )
  end

  it 'should delete the item' do
    get "/api/v1/items/#{@item.id}"
    expect(response).to be_successful

    delete "/api/v1/items/#{@item.id}"

    expect(response.status).to eq(204)
    expect(Item.all.length).to eq(0)
  end
end
