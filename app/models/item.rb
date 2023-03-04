class Item < ApplicationRecord
    belongs_to :genre

    attachment :image

    private

end
