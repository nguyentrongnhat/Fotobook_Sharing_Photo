class React < ApplicationRecord
	belongs_to :reactable, polymorphic: true, counter_cache: :count_of_reacts
end
