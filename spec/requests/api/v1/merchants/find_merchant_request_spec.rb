require 'rails_helper'

describe 'Merchant GET request finds' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Turing')
    @merchant2 = Merchant.create!(name: 'Haddersfield')
    @merchant3 = Merchant.create!(name: 'Ring World')
  end

  it 'I can send a GET request to /api/v1/merchants/find?name=value' do
    get '/api/v1/merchants/find?name=RING'

    merchant_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchant_response[:data][:id]).to eq("#{@merchant1.id}")
    expect(merchant_response[:data][:type]).to eq('merchant')
    expect(merchant_response[:data][:attributes][:name]).to eq(@merchant1.name)
  end

  it 'I can search for multiple merchants with /api/v1/merchants/find_all?name=value' do
    get '/api/v1/merchants/find_all?name=RING'

    merchants_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchants_response[:data].size).to eq(2)

    merchants_response[:data].each do |merchant|
      expect(merchant[:id]).to be_a(String)
      expect(merchant[:type]).to eq('merchant')
      expect(merchant[:attributes]).to have_key(:name)
    end
  end
end
