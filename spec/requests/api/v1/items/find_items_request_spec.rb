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

  it 'I get a 200 no content if it cannot find anything' do
    get '/api/v1/items/find?fuzzy=111.11'

    expect(response.status).to eq(200)
  end

  it 'I can search for an item by unit price' do
    get '/api/v1/items/find?unit_price=0.01'

    item_response = JSON.parse(response.body, symbolize_names: true)
    expect(item_response[:data][:id]).to eq("#{@item3.id}")
    expect(item_response[:data][:type]).to eq('item')
    expect(item_response[:data][:attributes][:name]).to eq(@item3.name)
    expect(item_response[:data][:attributes][:unit_price]).to eq(@item3.unit_price)
    expect(item_response[:data][:attributes][:description]).to eq(@item3.description)
    expect(item_response[:data][:attributes][:merchant_id]).to eq(@item3.merchant_id)
  end

  it 'I can get back multiple items' do
    get '/api/v1/items/find_all?name=fUzZ'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].size).to eq(2)
    items[:data].each do |item|
      expect(item[:id]).to be_a(String)
      expect(item[:type]).to eq('item')
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes]).to have_key(:merchant_id)
    end
  end

  it 'a 200 is returned if nothing is found' do
    get '/api/v1/items/find_all?description=awholelotofnonsensethatmeansnothing'

    expect(response.status).to eq(200)
  end

  it 'one can also search by unit_price or timestamps' do
    get "/api/v1/items/find_all?merchant_id=#{@item1.merchant.id}"

    expect(response.status).to eq(200)
  end
end
