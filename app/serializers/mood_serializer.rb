class MoodSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :tvshows, serializer: TvshowMoodSerializer
end
