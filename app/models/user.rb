class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Creating a variable AGE_RANGE which can later be used in other contexts and for the form:
  AGE_RANGES = ["under 18", "18-25", "26-40", "41-60", "above 60"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :habits, dependent: :destroy
  # uncomment when freindship logic and seeds is created
  # has_many :friendships, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :email, presence: true
end
