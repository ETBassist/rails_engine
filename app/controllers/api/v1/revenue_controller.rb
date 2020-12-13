class Api::V1::RevenueController < ApplicationController
  def revenue_in_range
    revenue = Merchant.revenue_between(params[:start], params[:end])
    render json: RevenueSerializer.format_revenue(revenue)
  end
end
