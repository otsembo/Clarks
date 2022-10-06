class User < ApplicationRecord
    enum :user_type, { buyer: 0, seller: 1, admin: 2 }
    has_many :shoes, dependent: :destroy
    has_many :carts, dependent: :destroy
    has_many :orders, dependent: :destroy
    validates :email, uniqueness: true
    has_secure_password
end
