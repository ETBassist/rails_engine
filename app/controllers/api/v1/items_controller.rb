class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemsSerializer.format_items(items)
  end
end
