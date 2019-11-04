class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_many :display_items, dependent: :delete_all
  has_one :user_profile
end
