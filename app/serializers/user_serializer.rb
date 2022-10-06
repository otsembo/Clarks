class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :display_picture, :user_type
end
