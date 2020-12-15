require 'rails_helper'

describe 'MerchantSerializer' do
  before :each do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
  end

  it 'can serialize a single merchant' do
    serialized_merchant = MerchantSerializer.new(@merchant1).to_json

    merchant = JSON.parse(serialized_merchant, symbolize_names: true)

    expect(merchant).to have_key(:data)
    expect(merchant[:data]).to be_a(Hash)
    expect(merchant[:data]).to have_key(:id)
    expect(merchant[:data][:id]).to be_a(String)
    expect(merchant[:data]).to have_key(:type)
    expect(merchant[:data][:type]).to eq('merchant')
    expect(merchant[:data]).to have_key(:attributes)
    expect(merchant[:data][:attributes]).to be_a(Hash)
    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to eq(@merchant1.name)
  end

  it 'can serialize mulitiple merchants' do
    serialized_merchants = MerchantSerializer.new([@merchant1, @merchant2]).to_json

    merchants = JSON.parse(serialized_merchants, symbolize_names: true)

    expect(merchants).to have_key(:data)
    expect(merchants[:data]).to be_a(Array)
    expect(merchants[:data].first).to have_key(:id)
    expect(merchants[:data].first[:id]).to be_a(String)
    expect(merchants[:data].first).to have_key(:type)
    expect(merchants[:data].first[:type]).to eq('merchant')
    expect(merchants[:data].first).to have_key(:attributes)
    expect(merchants[:data].first[:attributes]).to be_a(Hash)
    expect(merchants[:data].first[:attributes]).to have_key(:name)
    expect(merchants[:data].first[:attributes][:name]).to eq(@merchant1.name)
    expect(merchants[:data].second).to have_key(:id)
    expect(merchants[:data].second[:id]).to be_a(String)
    expect(merchants[:data].second).to have_key(:type)
    expect(merchants[:data].second[:type]).to eq('merchant')
    expect(merchants[:data].second).to have_key(:attributes)
    expect(merchants[:data].second[:attributes]).to be_a(Hash)
    expect(merchants[:data].second[:attributes]).to have_key(:name)
    expect(merchants[:data].second[:attributes][:name]).to eq(@merchant2.name)
  end
end
