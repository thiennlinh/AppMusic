class AddSpotifyToUsersHashBlob < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :spot_hash, :blob
  end
end
