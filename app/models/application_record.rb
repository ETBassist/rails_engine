class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_by(params)
    item = nil
    params.each do |key, value|
      if key == 'unit_price' || key == 'merchant_id'
        item = self.where("#{key} = ?", value)
      elsif key.present?
        item = self.where("lower(#{key}) like ?", "%#{value.downcase}%")
      end
    end
    item
  end
end
