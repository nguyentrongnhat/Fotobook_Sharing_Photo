class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	#validates :lastname, presence: true, length: { maximum: 15 }
	#validates :firstname, presence: true, length: { maximum: 15 }
	#validates :pass, presence: true, confirmation: true, length: { maximum: 15 }
	#validates :pass_confirmation, presence: true
	#validates :email, presence: true, length: { maximum: 15 }
	has_many :albums, dependent: :destroy
	has_many :photos, dependent: :destroy
	has_many :follows, dependent: :destroy
end
