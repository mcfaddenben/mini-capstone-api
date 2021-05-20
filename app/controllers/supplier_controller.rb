class SupplierController < ApplicationController
    def index
        suppliers = Supplier.all
         if params[:search_term]
            suppliers = suppliers.where("name ilike ?", "%#{params[:search_term]}%")
         end
        render json: suppliers
    end
    def show
        supplier = Supplier.find(params[:id])
        render json: supplier
    end
    def create
        supplier = Supplier.new(
            name:  params[:name],
            email:  params[:email],
            phone: params[:phone],
        )
        if supplier.save
            render json: supplier
        else
            render json: {errors: supplier.errors.full_mesages}
        end
    end
    def update
        supplier = Supplier.find(params[:id])
        supplier.name = params[:name] || supplier.name
        supplier.email = params[:email] || supplier.email
        supplier.phone = params[:phone] || supplier.phone
        
        if supplier.save
            render json: supplier
        else
            render json: {errors: supplier.errors.full_messages}
        end
    end
    def destroy
        supplier = Supplier.find(params[:id])
        supplier.destroy
        render json: {message: "Supplier deleted"}
    end
end
