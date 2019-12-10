class History < ApplicationRecord
  belongs_to :supporter, class_name: 'User'
  belongs_to :victim, class_name: 'User'
  belongs_to :supply
  has_many :notifications, dependent: :destroy

  enum receipt_status: { preparation: 0, delivery: 1, acceptance: 2 }
end
