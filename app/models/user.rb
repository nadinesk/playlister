#create_table "users", force: :cascade do |t|
#  t.string   "name"
#  t.integer  "current_playlist_id"
#  t.datetime "created_at",                          null: false
#  t.datetime "updated_at",                          null: false
#  t.string   "email",                  default: "", null: false
#  t.string   "encrypted_password",     default: "", null: false
#  t.string   "reset_password_token"
#  t.datetime "reset_password_sent_at"
#  t.datetime "remember_created_at"
#  t.integer  "sign_in_count",          default: 0,  null: false
#  t.datetime "current_sign_in_at"
#  t.datetime "last_sign_in_at"
#  t.string   "current_sign_in_ip"
#  t.string   "last_sign_in_ip"
#end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :playlists
  belongs_to :current_playlist, :class_name => "Playlist"

  def create_current_playlist
    new_playlist = playlists.create
    self.current_playlist_id = new_playlist.id
    save
  end

  def remove_cart
    self.current_playlist_id = nil
    save
  end

end
