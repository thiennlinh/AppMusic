class CreateJoinTablePlaylistMicropost < ActiveRecord::Migration[5.1]
  def change
    create_join_table :playlists, :microposts do |t|
      # t.index [:playlist_id, :micropost_id]
      # t.index [:micropost_id, :playlist_id]
    end
  end
end
