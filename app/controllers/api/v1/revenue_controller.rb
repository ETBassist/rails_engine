class Api::V1::RevenueController < ApplicationController
  def index
    revenue = Merchant.revenue_between(params[:start], params[:end])
    render json: RevenueSerializer.new(RevenueFacade.format_revenue(revenue))
  end
end
