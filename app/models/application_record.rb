class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_by(params)
    item = nil
    params.each do |key, value|
      if key == 'unit_price' || key == 'merchant_id'
        item = self.where("#{key} = ?", value)
      elsif key == 'created_at' || key == 'updated_at'
        date_range = (value.to_date.beginning_of_day..value.to_date.end_of_day)
        item = self.where("#{key}" =>  date_range)
      elsif key.present?
        item = self.where("lower(#{key}) like ?", "%#{value.downcase}%")
      end
    end
    item
  end
end
