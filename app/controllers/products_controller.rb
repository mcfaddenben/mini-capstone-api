class ProductsController < ApplicationController
    def all_products_method
        products = Product.all
        render json: products
    end
end
