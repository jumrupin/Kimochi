class Category < ApplicationRecord
  has_many :appointments
  has_many :supplies, through: :appointments
end
