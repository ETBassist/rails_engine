class Api::V1::ItemsSearchController < ApplicationController
  def find_single_item
    item = nil
    item_params.each do |key, value|
      if key == 'unit_price' || key == 'merchant_id'
        item = Item.find_by("#{key} = ?", value)
      elsif key.present?
        item = Item.find_by("lower(#{key}) like ?", "%#{value.downcase}%")
      end
    end

    if item
      render json: ItemSerializer.new(item)
    else
      head :no_content
    end
  end

  def find_plural_items
    items = nil
    item_params.each do |key, value|
      if key == 'unit_price' || key == 'merchant_id'
        items = Item.where("#{key} = ?", value)
      elsif key.present?
        items = Item.where("lower(#{key}) like ?", "%#{value.downcase}%")
      end
    end

    if items.empty?
      head :no_content
    else
      render json: ItemSerializer.new(items)
    end
  end

  private 

  def item_params
    params.permit(:name, :unit_price, :description, :merchant_id, :created_at, :update_at)
  end
end
