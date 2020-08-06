class Album < ApplicationRecord
	#validates :title, presence: true, length: { maximum: 100 }, allow_blank: true
	#validates :decription, length: { maximum: 1024 }, allow_blank: true
	#validates :source, presence: true
	belongs_to :user
	has_and_belongs_to_many :photos
	has_many :reacts, as: :reactable, dependent: :destroy
end
