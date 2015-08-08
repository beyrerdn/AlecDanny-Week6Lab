class RemoveColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :image
    remove_column :users, :bio
    remove_column :users, :username
  end
end
