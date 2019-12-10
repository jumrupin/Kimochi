class Comment < ApplicationRecord
  belongs_to :supply
  belongs_to :user
  has_many :notifications, dependent: :destroy
end
