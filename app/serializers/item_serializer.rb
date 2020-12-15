class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :merchant_id

#  def self.format_items(items)
#    {
#      data: items.map do |item|
#        format_data_for(item)
#      end
#    }
#  end
#
#  def self.format_item(item)
#    { data: format_data_for(item) }
#  end
#
#  module FormatAttributes
#    private
#
#    def format_data_for(item)
#      {
#        id: item.id.to_s,
#        type: 'item',
#        attributes: attributes_for(item)
#      }
#    end
#
#    def attributes_for(item)
#      {
#        name: item.name,
#        description: item.description,
#        unit_price: item.unit_price,
#        merchant_id: item.merchant_id
#      }
#    end
#  end
#
#  extend FormatAttributes
end
