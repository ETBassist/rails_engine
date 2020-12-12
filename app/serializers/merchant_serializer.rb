class MerchantSerializer
  def self.format_merchants(merchants)
    {
      data: merchants.map do |merchant|
        format_data_for(merchant)
      end
    }
  end

  def self.format_merchant(merchant)
    { data: format_data_for(merchant) }
  end

  module MerchantFormattable
    private

    def format_data_for(merchant)
      {
        id: merchant.id.to_s,
        type: 'merchant',
        attributes: {
          name: merchant.name
        }
      }
    end
  end

  extend MerchantFormattable
end
