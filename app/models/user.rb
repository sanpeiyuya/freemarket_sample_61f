class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy

  has_many :display_items, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_one :credit_card, dependent: :destroy

end
