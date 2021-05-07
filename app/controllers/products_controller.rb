class ProductsController < ApplicationController
    def all_products_method
        products = Product.all
        render json: products.as_json
    end
    def single_product
        product = Product.find_by(name: params[:name])
        render json: product.as_json
    end
end
