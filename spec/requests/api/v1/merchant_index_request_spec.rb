require 'rails_helper'

describe 'Merchant Index Endpoint' do
  describe 'I can send a GET request do /api/v1/merchants' do
    before :each do
      create_list(:merchant, 5)
    end

    it 'and I should see a JSON response of merchants' do
      get '/api/v1/merchants'

      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns a status code of 200 OK success' do
      get '/api/v1/merchants'

      expect(@response).to have_http_status(:success)
    end
  end
end
