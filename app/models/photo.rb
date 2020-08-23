class Photo < ApplicationRecord
	validates :title, length: { maximum: 20 }, allow_blank: true
	validates :decription, length: { maximum: 100 }, allow_blank: true
	validates :source, presence: true
	belongs_to :user, counter_cache: :count_of_photos
	has_many :aps
	has_many :albums, through: :aps
	has_many :reacts, as: :reactable, dependent: :destroy
	mount_uploader :source, PictureUploader
end
