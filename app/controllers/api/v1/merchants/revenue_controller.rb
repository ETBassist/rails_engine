class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: RevenueSerializer.format_revenue(merchant.revenue)
  end
end
