require 'rails_helper'

describe 'POST to items' do
  describe 'If I send a POST request to /api/v1/items' do
    before :each do
      @merchant = Merchant.create!(name: 'James Hoffman')
      @item_params = {
        name: Faker::Coffee.blend_name,
        description: Faker::Coffee.notes,
        unit_price: 12.99,
        merchant_id: @merchant.id
      }
    end

    it 'I get a response with the new items details' do
      post '/api/v1/items', params: @item_params

      item_response = JSON.parse(response.body, symbolize_names: true)
      expect(item_response).to have_key(:data)
      expect(item_response[:data][:id]).to be_a(String)
      expect(item_response[:data][:type]).to eq('item')
      expect(item_response[:data][:attributes]).to have_key(:name)
      expect(item_response[:data][:attributes][:name]).to eq("#{@item_params[:name]}")
      expect(item_response[:data][:attributes]).to have_key(:description)
      expect(item_response[:data][:attributes][:description]).to eq("#{@item_params[:description]}")
      expect(item_response[:data][:attributes]).to have_key(:unit_price)
      expect(item_response[:data][:attributes][:unit_price]).to eq("#{@item_params[:unit_price]}")
      expect(item_response[:data][:attributes]).to have_key(:merchant_id)
      expect(item_response[:data][:attributes][:merchant_id]).to eq("#{@merchant.id}")
    end
  end
end
