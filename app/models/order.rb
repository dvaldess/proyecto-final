class Order < ApplicationRecord
  belongs_to :client
  belongs_to :user
end
