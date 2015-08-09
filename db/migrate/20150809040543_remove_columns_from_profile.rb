class RemoveColumnsFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :image
    remove_column :profiles, :bio
    remove_column :profiles, :username
  end
end
