class AddUrlToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :url, :string
    add_column :microposts, :score, :number
  end
end
