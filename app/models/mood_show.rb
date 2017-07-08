
class MoodShow < ActiveRecord::Base

	belongs_to :tvshow
	belongs_to :mood

end

