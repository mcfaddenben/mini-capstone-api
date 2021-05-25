class ProductsController < ApplicationController
    
    before_action :authenticate_admin, except:[:index, :show]
    
    def index
        products = Product.all
         if params[:search_term]
            products = products.where("name ilike ?", "%#{params[:search_term]}%")
          end
          if params[:category]
            category = Category.find_by("name ilike ?", "%#{params[:category]}%")
            products = category.products
          end
            

        render json: products
    end
    def show
        product = Product.find(params[:id])
        render json: product
    end
    def create
        product = Product.new(
            name:  params[:name],
            price:  params[:price],
            image_url: params[:image_url],
            description:  params[:description],
            stock: params[:stock]
        )
        if product.save
            render json: product
        else
            render json: {errors: product.errors.full_mesages}
        end
    end
    def update
        product = Product.find(params[:id])
        product.name = params[:name] || product.name
        product.price = params[:price] || product.price
        product.image_url = params[:image_url] || product.image_url
        product.description = params[:description] || product.description
        product.stock = params[:stock] || product.stock
        if product.save
            render json: product
        else
            render json: {errors: product.errors.full_messages}
        end
    end
    def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {message: "Product deleted"}
    end
end
