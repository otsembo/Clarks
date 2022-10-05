class Order < ApplicationRecord
    enum :status, [:pending, :completed, :cancelled]
    belongs_to :user
end
