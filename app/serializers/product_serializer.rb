class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url, :description, :stock, :tax, :total, :supplier_name
end
