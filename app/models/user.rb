class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :supplies
  has_many :comments
  has_many :active_histories, class_name: 'History', foreign_key: "supporter_id"
  has_many :victim_id, through: :active_histories
  has_many :passive_histories, class_name: 'History', foreign_key: "victim_id"
  has_many :supporter_id, through: :passive_historiess
  has_many :addresses
  has_many :likes, dependent: :destroy
  has_many :likes_supplies, through: :likes, source: :supply
  has_many :lists
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  attachment :user_image, destroy: false

  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :birthday, presence: true
  validates :telephone, presence: true, format: {with: /\A[0-9-]{,14}\z/}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }


  def already_liked?(supply)
    self.likes.exists?(supply_id: supply.id)
  end


end
