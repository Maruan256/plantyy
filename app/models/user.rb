class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :my_garden, dependent: :destroy
  has_many :garden_kits, through: :my_garden
  has_one_attached :photo
end
