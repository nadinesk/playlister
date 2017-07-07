class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :playlists
  belongs_to :current_playlist, :class_name => "Playlist"

  def create_current_playlist
    new_playlist = playlists.create
    self.current_playlist_id = new_playlist.id
    save
  end

  def remove_cart
    binding.pry
    self.current_playlist_id = nil
    save
  end
end


