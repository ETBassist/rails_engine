class Api::V1::ItemsSearchController < ApplicationController
  def find_single_item
    item = nil
    item_params.each do |key, value|
      if key == 'unit_price' || key == 'merchant_id'
        item = Item.find_by("#{key} = ?", value)
      elsif key.present?
        item = Item.find_by("lower(#{key}) like ?", "%#{value.to_s.downcase}%")
      end
    end

    if item
      render json: ItemsSerializer.format_item(item)
    else
      head :no_content
    end
  end

  private 

  def item_params
    params.permit(:name, :unit_price, :description, :merchant_id, :created_at, :update_at)
  end
end
