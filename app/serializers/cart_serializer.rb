class CartSerializer < ActiveModel::Serializer
  attributes :id, :shoe, :qty, :active

  def shoe
    shoe = Shoe.find(object.shoe_id)
    {
      id: shoe.id,
      name: shoe.name
    }
  end

end
