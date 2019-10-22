class Comment < ApplicationRecord
  belongs_to :supply
  belongs_to :user
end
