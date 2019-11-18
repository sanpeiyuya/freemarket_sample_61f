class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: %i[facebook google_oauth2]

  has_one :address, dependent: :destroy

  has_many :display_items, dependent: :delete_all
  has_many :trading_items, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :sns_credentials, dependent: :destroy
  has_one :credit_card, dependent: :destroy


  validates :nickname, presence: true
  validates :email, presence: true, uniqueness:true
  validates :password, confirmation: true, presence: true,length: { in: 7..128, message: "パスワードは8文字以上128文字以下で入力してください" },on: :create
  validates :password_confirmation, presence: true,on: :create
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :phone, presence: true, format: {with: /\A[0-9]+\z/}

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential
    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = User.create(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
        )
      end
    end
    # hashでsnsのidを返り値として保持しておく
  return { user: user , sns_id: sns.id }
  end
end