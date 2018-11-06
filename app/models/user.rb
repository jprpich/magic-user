class User < ApplicationRecord
  validates :name, :color, presence: true
end
