class RenameFollowedIdColmnToFollowingId < ActiveRecord::Migration[5.2]
  def change
     rename_column :relationships, :followed_id, :following_id
  end
end
