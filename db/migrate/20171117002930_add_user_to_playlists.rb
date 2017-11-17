class AddUserToPlaylists < ActiveRecord::Migration[5.1]
  def change
	add_column :playlists, :user_id, :integer
	add_foreign_key :playlists, :users
  end
end
