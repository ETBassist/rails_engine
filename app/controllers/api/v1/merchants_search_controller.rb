class Api::V1::MerchantsSearchController < ApplicationController
  def find_single_merchant
    merchant = Merchant.where('lower(name) like ?', "%#{params[:name].downcase}%").first
    render json: MerchantSerializer.format_merchant(merchant)
  end
end
