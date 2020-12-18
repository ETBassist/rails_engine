require 'rails_helper'

describe 'Merchant POST Request' do
  before :each do
    @merchant_params = {
      name: Faker::Cosmere.herald
    }
  end

  it 'I can create a merchant with a POST to /api/v1/merchants' do
    post '/api/v1/merchants', params: @merchant_params

    merchant_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchant_response[:data]).to have_key(:id)
    expect(merchant_response[:data]).to have_key(:type)
    expect(merchant_response[:data][:type]).to eq('merchant')
    expect(merchant_response[:data][:attributes]).to have_key(:name)
    expect(merchant_response[:data][:attributes][:name]).to eq(@merchant_params[:name])
  end

  it 'I get a 400 bad request status if the POST is missing required fields' do
    bad_merchant_params = { name: '' }

    post '/api/v1/merchants', params: bad_merchant_params

    expect(response.status).to eq(400)

    expect(response.body).to eq("Name can't be blank")
  end
end
