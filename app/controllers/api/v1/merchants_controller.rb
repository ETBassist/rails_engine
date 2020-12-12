class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    render json: MerchantSerializer.format_merchants(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.format_merchant(merchant)
  end

  def create
    merchant = Merchant.create!(merchant_params)
    render json: MerchantSerializer.format_merchant(merchant)
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
