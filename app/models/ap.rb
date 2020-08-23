class Ap < ApplicationRecord
	belongs_to :album, counter_cache: :count_of_photos
	belongs_to :photo, counter_cache: :count_of_albums
end
