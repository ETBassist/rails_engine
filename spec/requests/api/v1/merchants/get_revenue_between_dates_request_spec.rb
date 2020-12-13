require 'rails_helper'

describe 'GET Revenue Between Dates' do
  before :each do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    invoice1 = create(:invoice, merchant: @merchant1, status: 'shipped', created_at: 2.days.ago.strftime('%Y-%m-%d'))
    invoice2 = create(:invoice, merchant: @merchant1, status: 'shipped', created_at: 1.days.ago.strftime('%Y-%m-%d'))
    invoice3 = create(:invoice, merchant: @merchant1, status: 'pending', created_at: 8.days.ago.strftime('%Y-%m-%d'))
    invoice4 = create(:invoice, merchant: @merchant1, status: 'pending', created_at: 7.days.ago.strftime('%Y-%m-%d'))
    invoice5 = create(:invoice, merchant: @merchant2, status: 'shipped', created_at: 5.days.ago.strftime('%Y-%m-%d'))
    invoice6 = create(:invoice, merchant: @merchant2, status: 'shipped', created_at: 5.days.ago.strftime('%Y-%m-%d'))
    invoice7 = create(:invoice, merchant: @merchant2, status: 'shipped', created_at: 5.days.ago.strftime('%Y-%m-%d'))
    invoice8 = create(:invoice, merchant: @merchant2, status: 'shipped', created_at: 10.days.ago.strftime('%Y-%m-%d'))
    create_list(:invoice_item, 2, invoice: invoice1, quantity: 1, unit_price: 2.0)
    create_list(:invoice_item, 4, invoice: invoice2, quantity: 3, unit_price: 4.0)
    create_list(:invoice_item, 4, invoice: invoice3, quantity: 11, unit_price: 4.0)
    create_list(:invoice_item, 4, invoice: invoice4, quantity: 46, unit_price: 4.0)
    create_list(:invoice_item, 10, invoice: invoice5, quantity: 40, unit_price: 11.0)
    create_list(:invoice_item, 10, invoice: invoice6, quantity: 40, unit_price: 11.0)
    create_list(:invoice_item, 10, invoice: invoice7, quantity: 40, unit_price: 11.0)
    create_list(:invoice_item, 10, invoice: invoice8, quantity: 40, unit_price: 11.0)
    create(:transaction, invoice: invoice1, result: 'success')
    create(:transaction, invoice: invoice2, result: 'success')
    create(:transaction, invoice: invoice3, result: 'success')
    create(:transaction, invoice: invoice4, result: 'failed')
    create(:transaction, invoice: invoice5, result: 'success')
    create(:transaction, invoice: invoice6, result: 'success')
    create(:transaction, invoice: invoice7, result: 'success')
    create(:transaction, invoice: invoice8, result: 'success')
  end

  it 'returns revenue as attribute in response' do
    date1 = 6.days.ago.strftime('%Y-%m-%d')
    date2 = 4.days.ago.strftime('%Y-%m-%d')
    get "/api/v1/revenue?start=#{date1}&end=#{date2}"

    revenue = JSON.parse(response.body, symbolize_names: true)
    expect(revenue[:data][:attributes][:revenue]).to eq(13200.0)
  end
end
