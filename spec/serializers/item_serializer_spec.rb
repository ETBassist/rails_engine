require 'rails_helper'

describe 'Item Serializer' do
  before :each do
    @item1 = create(:item)
    @item2 = create(:item)
  end

  it 'can serialize multiple item objects' do
    serialized_items = ItemSerializer.new([@item1, @item2]).to_json

    items = JSON.parse(serialized_items, symbolize_names: true)

    expect(items).to have_key(:data)
    expect(items[:data]).to be_a(Array)
    expect(items[:data].first).to have_key(:id)
    expect(items[:data].first[:id]).to eq("#{@item1.id}")
    expect(items[:data].first[:type]).to eq("item")
    expect(items[:data].first).to have_key(:attributes)
    expect(items[:data].first[:attributes]).to have_key(:name)
    expect(items[:data].first[:attributes][:name]).to eq(@item1.name)
    expect(items[:data].first[:attributes]).to have_key(:description)
    expect(items[:data].first[:attributes][:description]).to eq(@item1.description)
    expect(items[:data].first[:attributes]).to have_key(:unit_price)
    expect(items[:data].first[:attributes][:unit_price]).to eq(@item1.unit_price)
    expect(items[:data].first[:attributes]).to have_key(:merchant_id)
    expect(items[:data].first[:attributes][:merchant_id]).to eq(@item1.merchant_id)
    expect(items[:data].second).to have_key(:id)
    expect(items[:data].second[:id]).to eq("#{@item2.id}")
    expect(items[:data].second[:type]).to eq("item")
    expect(items[:data].second).to have_key(:attributes)
    expect(items[:data].second[:attributes]).to have_key(:name)
    expect(items[:data].second[:attributes][:name]).to eq(@item2.name)
    expect(items[:data].second[:attributes]).to have_key(:description)
    expect(items[:data].second[:attributes][:description]).to eq(@item2.description)
    expect(items[:data].second[:attributes]).to have_key(:unit_price)
    expect(items[:data].second[:attributes][:unit_price]).to eq(@item2.unit_price)
    expect(items[:data].second[:attributes]).to have_key(:merchant_id)
    expect(items[:data].second[:attributes][:merchant_id]).to eq(@item2.merchant_id)
  end

  it 'can serialize a single item' do
    serialized_item = ItemSerializer.new(@item2).to_json

    item = JSON.parse(serialized_item, symbolize_names: true)

    expect(item).to have_key(:data)
    expect(item[:data]).to be_a(Hash)
    expect(item[:data]).to have_key(:id)
    expect(item[:data][:id]).to be_a(String)
    expect(item[:data]).to have_key(:type)
    expect(item[:data][:type]).to eq('item')
    expect(item[:data]).to have_key(:attributes)
    expect(item[:data][:attributes]).to be_a(Hash)
    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to eq(@item2.name)
    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:description]).to eq(@item2.description)
    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:unit_price]).to eq(@item2.unit_price)
    expect(item[:data][:attributes]).to have_key(:merchant_id)
    expect(item[:data][:attributes][:merchant_id]).to eq(@item2.merchant_id)
  end
end
