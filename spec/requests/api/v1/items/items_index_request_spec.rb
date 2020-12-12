require 'rails_helper'

describe 'Items Index Endpoint' do
  describe 'I can send a GET request to /api/v1/items' do
    before :each do
      create_list(:item, 20)
    end

    it 'and I should get a JSON response of all items' do
      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)
      expect(items[:data].size).to eq(20)
      items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(Integer)
        expect(item[:type]).to eq('item')
        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)
        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes][:description]).to be_a(String)
        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes][:unit_price]).to be_a(Float)
        expect(item[:attributes]).to have_key(:merchant_id)
        expect(item[:attributes][:merchant_id]).to be_a(Integer)
      end
    end
  end
end
