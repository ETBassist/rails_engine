require 'rails_helper'

describe 'Item GET request finds' do
  before :each do
    @item1 = create(:item, name: 'Fuzzy Slippers')
    @item2 = create(:item, name: 'Fuzzy Bear')
    @item3= create(:item, unit_price: 0.01)
    @item4= create(:item, name: 'Bear Claw')
    @item5= create(:item, description: 'The comfiest tasting of coffees')
    @item6 = create(:item, name: 'Star Wars: an opinionated evaluation of its faults and failures by a dude on the internet')
  end

  it 'I can find a record by its name' do
    get '/api/v1/items/find?name=fuzz'

    item_response = JSON.parse(response.body, symbolize_names: true)

    expect(item_response[:data][:id]).to eq("#{@item1.id}")
    expect(item_response[:data][:type]).to eq('item')
    expect(item_response[:data][:attributes][:name]).to eq(@item1.name)
    expect(item_response[:data][:attributes][:unit_price]).to eq(@item1.unit_price)
    expect(item_response[:data][:attributes][:description]).to eq(@item1.description)
    expect(item_response[:data][:attributes][:merchant_id]).to eq(@item1.merchant_id)
  end
end
