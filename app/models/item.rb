class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items
    has_many :order_details

    attachment :image

    def price_with_tax
    (price*1.1).floor
    end

end
