class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: {in:('@')}
  validates :encrypted_password, presence: true, length: {minmum:6 }, format: {with: /\A[a-z0-9]+\z/i }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/ }
  validates :family_name, presence: true, format: {with: /\A[ァ-ヶー]+\z/ }
  validates :birthday, presence: true
end
