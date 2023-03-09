class BuyerRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name,
                       phone_number: phone_number, record_id: record.id)
  end
end