class Cart < ApplicationRecord
    belongs_to :user
    has_many :shoes
end
