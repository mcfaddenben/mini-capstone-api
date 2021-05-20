class Product < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, numericality:  {only_integer: true, greater_than_or_equal_to: 0}
    validates :description, length: {maximum: 1000}
    validates :stock, numericality: {only_integer: true,greater_than_or_equal_to: 0}

    belongs_to :supplier

    def supplier_name
        supplier.name
    end

    def is_discounted?
       price < 100
    end
    def tax
        price * 0.09
    end
    def total
        price + tax
    end
end
