class RenameCoColumnToPostComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_comments, :co, :comment
  end
end
