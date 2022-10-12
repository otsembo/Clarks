class OrderSerializer < ActiveModel::Serializer
  attributes :id

  def cart
    JSON.parse(object.cart_data)
  end

end
