class Image < ApplicationRecord
  belongs_to :supply
  attachment :supply_image
end
