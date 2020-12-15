class Api::V1::MerchantsSearchController < ApplicationController
  def show
    merchants = Merchant.search_by(merchant_params)

    if merchants.empty?
      head :not_found
    else
      render json: MerchantSerializer.new(merchants.first)
    end
  end

  def index
    merchants = Merchant.search_by(merchant_params)

    if merchants.empty?
      head :not_found
    else 
      render json: MerchantSerializer.new(merchants)
    end
  end

  def find_by_revenue
    render json: MerchantSerializer.new(Merchant.by_revenue(params[:quantity]))
  end

  def find_by_items
    render json: MerchantSerializer.new(Merchant.by_items_sold(params[:quantity]))
  end
  
  private

  def merchant_params
    params.permit(:name, :created_at, :updated_at)
  end
end
