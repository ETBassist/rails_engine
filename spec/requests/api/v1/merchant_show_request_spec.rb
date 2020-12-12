require 'rails_helper'

describe 'Merchant Show Endpoint' do
  describe 'if I send a GET requst to /api/v1/merchant/:id' do
    before :each do
      @merchant = create(:merchant)
    end

    it 'I get a JSON response with the details for that merchant' do
      get "/api/v1/merchant/#{@merchant.id}"

      merchant = JSON.parse(response.body, symbolize_names: true)
      expect(merchant[:data][:id]).to eq(@merchant.id.to_s)
      expect(merchant[:data][:type]).to eq('merchant')
      expect(merchant[:data][:attributes][:name]).to eq(@merchant.name)
    end
  end
end
