require 'rails_helper'

describe 'Merchant Index Endpoint' do
  describe 'I can send a GET request do /api/v1/merchants' do
    before :each do
      create_list(:merchant, 5)
    end

    it 'and I should see a JSON response of merchants' do
      get '/api/v1/merchants'

      merchants = JSON.parse(response.body, symbolize_names: true)
      expect(merchants[:data].size).to eq(5)
      merchants[:data].each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_a(String)
        expect(merchant[:type]).to eq('merchant')
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end

    it 'returns a status code of 200 OK success' do
      get '/api/v1/merchants'

      expect(response).to have_http_status(:success)
    end
  end
end
