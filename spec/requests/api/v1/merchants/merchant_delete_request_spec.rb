require 'rails_helper'

describe 'Merchant DELETE request' do
  before :each do
    @merchant = Merchant.create!(name: Faker::Cosmere.herald)
  end

  it 'I can send a DELETE request to delete a particular merchant' do
    expect(Merchant.all.size).to eq(1)

    get "/api/v1/merchants/#{@merchant.id}"

    expect(response).to be_successful

    delete "/api/v1/merchants/#{@merchant.id}"

    expect(response.status).to eq(204)
    expect(Merchant.all.size).to eq(0)
  end
end
