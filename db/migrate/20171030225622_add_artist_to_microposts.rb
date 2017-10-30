class AddArtistToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :artist, :string
  end
end
