class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :auth_token, uniqueness: true
  before_create :generate_authentication_token!

  has_many :products, dependent: :destroy
end
