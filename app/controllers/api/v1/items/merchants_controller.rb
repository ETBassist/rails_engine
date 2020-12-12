class Api::V1::Items::MerchantsController < ApplicationController
  def show
    item = Item.find(params[:id])
    render json: MerchantSerializer.format_merchant(item.merchant)
  end
end
