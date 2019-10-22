class History < ApplicationRecord
  belongs_to :supporter, class_name: 'User'
  belongs_to :victim, class_name: 'User'
  belongs_to :supply
end
