require 'rails_helper'

describe 'Merchant PATCH endpoint' do
  before :each do
    @merchant = Merchant.create!(name: Faker::Cosmere.herald)
  end

  it 'I can send a patch request to update a merchant' do
    merchant_params = { name: 'Jimmy Neutron' }

    patch "/api/v1/merchants/#{@merchant.id}", params: merchant_params

    merchant_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchant_response[:data][:id]).to eq("#{@merchant.id}")
    expect(merchant_response[:data][:type]).to eq('merchant')
    expect(merchant_response[:data][:attributes][:name]).to eq('Jimmy Neutron')

    expect(@merchant.reload.name).to eq('Jimmy Neutron')
  end
end
