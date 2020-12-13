require 'rails_helper'

describe 'Merchant GET request finds' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Turing')
    @merchant2 = Merchant.create!(name: 'Haddersfield')
  end

  it 'I can send a GET request to /api/v1/merchants/find?name=value' do
    get '/api/v1/merchants/find?name=RING'

    merchant_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchant_response[:data][:id]).to eq("#{@merchant1.id}")
    expect(merchant_response[:data][:type]).to eq('merchant')
    expect(merchant_response[:data][:attributes][:name]).to eq(@merchant.name)
  end
end
