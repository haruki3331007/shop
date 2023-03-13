class Address < ApplicationRecord
    belongs_to :customer

    def information
        "〒" + self.postal_code + " " + self.address + " " + self.name 
    end
end
