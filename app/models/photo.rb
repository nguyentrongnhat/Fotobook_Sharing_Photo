class Photo < ApplicationRecord
	#validates :title, length: { maximum: 100 }, allow_blank: true
	#validates :decription, length: { maximum: 1024 }, allow_blank: true
	#validates :source, presence: true
	belongs_to :user
	has_many :aps
	has_many :albums, through: :aps
	has_many :reacts, as: :reactable, dependent: :destroy
	mount_uploader :source, PictureUploader
end
