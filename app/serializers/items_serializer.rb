class ItemsSerializer
  def self.format_items(items)
    {
      data: items.map do |item|
        {
          id: item.id,
          type: 'item',
          attributes: attributes_for(item)
        }
      end
    }
  end

  def self.format_item(item)
    {
      data: {
        id: item.id.to_s,
        type: 'item',
        attributes: attributes_for(item)
      }
    }
  end

  module FormatAttributes
    private

    def attributes_for(item)
      {
        name: item.name,
        description: item.description,
        unit_price: item.unit_price,
        merchant_id: item.merchant_id
      }
    end
  end

  extend FormatAttributes
end
