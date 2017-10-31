class CreateNestcoms < ActiveRecord::Migration[5.1]
  def change
    create_table :nestcoms do |t|
      t.text :title
      t.text :body
      t.references :users
      t.references :microposts

      t.timestamps
    end
  end
end
