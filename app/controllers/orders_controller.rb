class OrdersController < ApplicationController
    
    before_action :authenticate_user
    
    def create
        order = Order.new(
            user_id: current_user.id,
            product_id: params[:product_id],
            quantity: params[:quantity],
            subtotal: params[:subtotal],
            tax: params[:tax],
            total: params[:total],
        )
        if order.save
            render json: {message: "order created successfuly"}
        else
            render json: {mesage: order.errors.full_messages}, status: 422
        end
    end

    def show
        order = Order.find(params[:order_id])
        render json: order.as_json
    end
    def index
        orders = Order.all
        render json: orders.as_json
    end
end
