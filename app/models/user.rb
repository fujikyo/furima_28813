class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ユーザー情報
  validates :nickname, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /@/ }
  
  validates :password, length: { minimum: 6 }
  # # パスワードに半角英数字を含む
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  # ユーザー名関連
  validates :firstname_hira, :lastname_hira, :firstname_kana, :lastname_kana, :birthday, presence: true
  validates :firstname_hira, :lastname_hira, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :firstname_kana, :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  # アソシエーション
  has_many :purchases
  has_many :items
end