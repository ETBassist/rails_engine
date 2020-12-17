require 'rails_helper'

describe 'Reveue Poro' do
  it 'has attributes of id and revenue' do
    revenue_object = Revenue.new(408011.01)

    expect(revenue_object.id).to eq(nil)
    expect(revenue_object.revenue).to eq(408011.01)
  end
end
