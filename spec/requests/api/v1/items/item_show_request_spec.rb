require 'rails_helper'

describe 'Item Show Endpoint' do
  describe 'I can send a GET request to /api/v1/:item_id' do
    before :each do
      @item = create(:item)
    end

    it 'and I should get a JSON response of just that item' do;
      get "/api/v1/items/#{@item.id}"

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)
      expect(item[:data][:type]).to eq('item')
      expect(item[:data][:id]).to eq(@item.id.to_s)
      expect(item[:data][:attributes][:name]).to eq(@item.name) # probably some way to do [:attributes].each
      expect(item[:data][:attributes][:description]).to eq(@item.description)
      expect(item[:data][:attributes][:unit_price]).to eq("#{@item.unit_price}")
      expect(item[:data][:attributes][:merchant_id]).to eq("#{@item.merchant_id}")
    end
  end
end
