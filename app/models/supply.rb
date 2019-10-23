class Supply < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :images, dependent: :destroy
  has_many :appointments
  has_many :categories, through: :appointments
  has_one :history
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :appointments, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  accepts_attachments_for :images, attachment: :supply_image

  def self.search(search)
    if search
      Supply.where(['title LIKE ? OR size LIKE ? OR comment LIKE ? OR condition LIKE?', "#{search}%", "#{search}%", "#{search}%", "#{search}%"])
    else
      Supply.all
    end
  end


end
