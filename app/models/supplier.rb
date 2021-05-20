class Supplier < ApplicationRecord
    has_many :products
    def products_list
        products.index
    end
end
