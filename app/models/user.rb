class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: {in:('@')}
  validates :encrypted_password, presence: true, format: {with: /\A[a-z0-9]+\z/i }, length: { minimum:6 }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "First name is invalid. Input full-width characters"}
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Family name is invalid. Input full-width characters"}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/, message: "First name kana is invalid. Input full-width katakana characters"}
  validates :family_name, presence: true, format: {with: /\A[ァ-ヶー]+\z/, message: "Family name kana is invalid. Input full-width katakana characters"}
  validates :birthday, presence: true
end
