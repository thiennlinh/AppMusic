class CreatePolycoms < ActiveRecord::Migration[5.1]
  def change
    create_table :polycoms do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
