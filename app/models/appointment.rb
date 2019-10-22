class Appointment < ApplicationRecord
  belongs_to :supply
  belongs_to :category
end
