class User < ApplicationRecord
    enum :type, [ :buyer, :seller, :admin ]
    has_many :shoes, dependent: :destroy
    has_many :carts, dependent: :destroy
    has_many :orders, dependent: :destroy
end
