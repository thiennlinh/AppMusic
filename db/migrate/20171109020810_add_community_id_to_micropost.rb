class AddCommunityIdToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :community_id, :integer
  end
end
