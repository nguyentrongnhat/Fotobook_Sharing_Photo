class Follow < ApplicationRecord
	belongs_to :user, counter_cache: :count_of_followings
end
