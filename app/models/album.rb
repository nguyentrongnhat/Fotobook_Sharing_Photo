class Album < ApplicationRecord
	validates :title, presence: true, length: { minimum: 4, maximum: 100 }, allow_blank: true
	#validates :decription, length: { maximum: 1024 }, allow_blank: true
	#validates :source, presence: true
	belongs_to :user
	has_many :aps, dependent: :destroy
	has_many :photos, through: :aps
	has_many :reacts, as: :reactable, dependent: :destroy
end
