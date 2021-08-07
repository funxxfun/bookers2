class RenameFollowingIdColumnToFollowedId < ActiveRecord::Migration[5.2]
  def change
  rename_column :relationships, :following_id, :followed_id
  end
end
