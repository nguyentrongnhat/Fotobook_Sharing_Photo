class Album < ApplicationRecord
	validates :title, presence: true, length: { minimum: 4, maximum: 50 }, allow_blank: true
	validates :decription, length: { maximum: 200 }, allow_blank: true
	validates :source, presence: true
	belongs_to :user, counter_cache: :count_of_albums
	has_many :aps, dependent: :destroy
	has_many :photos, through: :aps
	has_many :reacts, as: :reactable, dependent: :destroy
	mount_uploader :source, ThumbnailUploader
end
