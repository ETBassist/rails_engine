require 'rails_helper'

describe 'Revenue Facade' do
  it 'instantiates a Revenue object when given an integer' do
    revenue = RevenueFacade.format_revenue(30000000.11)

    expect(revenue).to be_a(Revenue)
    expect(revenue.id).to eq(nil)
    expect(revenue.revenue).to eq(30000000.11)
  end
end
