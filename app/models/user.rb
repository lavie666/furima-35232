class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name,           presence: true
  validates :birthday,            presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_katakana
    validates :first_name_katakana
  end

  has_many :items
  has_many :orders
end


# validates :first_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ , message: "を入力してください"}