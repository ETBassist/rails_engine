require 'rails_helper'

describe 'GET request for a merchants revenue' do
  before :each do
    @merchant2 = create(:merchant)
    invoice5 = create(:invoice, merchant: @merchant2, status: 'shipped')
    invoice6 = create(:invoice, merchant: @merchant2, status: 'shipped')
    invoice7 = create(:invoice, merchant: @merchant2, status: 'shipped')
    invoice8 = create(:invoice, merchant: @merchant2, status: 'shipped')
    create_list(:invoice_item, 10, invoice: invoice5, quantity: 40, unit_price: 11.0)
    create_list(:invoice_item, 10, invoice: invoice6, quantity: 40, unit_price: 11.0)
    create_list(:invoice_item, 10, invoice: invoice7, quantity: 40, unit_price: 11.0)
    create_list(:invoice_item, 10, invoice: invoice8, quantity: 40, unit_price: 11.0)
    create(:transaction, invoice: invoice5, result: 'success')
    create(:transaction, invoice: invoice6, result: 'success')
    create(:transaction, invoice: invoice7, result: 'success')
    create(:transaction, invoice: invoice8, result: 'success')
  end

  it 'returns total revenue for a merchant' do
    get "/api/v1/merchants/#{@merchant2.id}/revenue"

    total_revenue = JSON.parse(response.body, symbolize_names: true)
    expect(total_revenue[:data][:attributes][:revenue]).to eq(17600.0)
  end
end
