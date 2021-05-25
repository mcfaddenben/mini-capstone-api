class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :stock, :tax, :total, :supplier_name, :images
  has_many :categories
end
