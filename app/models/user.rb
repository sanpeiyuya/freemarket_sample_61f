class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy

  has_many :display_items, dependent: :delete_all
  has_many :trading_items, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_one :credit_card, dependent: :destroy


  validates :nickname, presence: true
  validates :email, presence: true, uniqueness:true
  validates :password, confirmation: true, presence: true,length: { in: 7..128, message: "パスワードは8文字以上128文字以下で入力してください" }
  validates :password_confirmation, presence: true
  validates :family_name, presence: true
  # , format: { with: zenkaku }
  validates :given_name, presence: true
  # , format: { with: zenkaku }
  validates :family_name_kana, presence: true
  # , format: { with: kana }
  validates :given_name_kana, presence: true
  # , format: { with: kana }
  # validates :birth_year, presence: true,
  # validates :birth_month, presence: true,
  # validates :birth_day, presence: true, message: "生年月日を入力してください"
  validates :phone, presence: true, format: {with: /\A[0-9]+\z/}
end

@user = User.new
@user.valid? # => false
@user.errors.messages