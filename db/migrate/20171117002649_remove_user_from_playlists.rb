class RemoveUserFromPlaylists < ActiveRecord::Migration[5.1]
  def change
    remove_column :playlists, :user_id, :integer
  end
end
