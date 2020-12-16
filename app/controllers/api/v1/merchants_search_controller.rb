class Api::V1::MerchantsSearchController < ApplicationController
  def show
    merchant = Merchant.search_for_one(merchant_params)

    render json: MerchantSerializer.new(merchant)
  end

  def index
    merchants = Merchant.search_for_many(merchant_params)

    render json: MerchantSerializer.new(merchants)
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
