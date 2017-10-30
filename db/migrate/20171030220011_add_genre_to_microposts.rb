class AddGenreToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :genre, :string
  end
end
