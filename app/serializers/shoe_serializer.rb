class ShoeSerializer < ActiveModel::Serializer
  attributes :id, :name, :qty, :size, :price, :color, :user
  belongs_to :user
end
