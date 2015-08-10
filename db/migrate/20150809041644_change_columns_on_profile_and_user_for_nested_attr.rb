class ChangeColumnsOnProfileAndUserForNestedAttr < ActiveRecord::Migration
  def change
    remove_column :users, :username
    remove_column :users, :bio
    remove_column :users, :image
    remove_column :users, :first_name
    remove_column :users, :last_name
    add_column :profiles, :username, :string
    add_column :profiles, :bio, :text
    add_column :profiles, :image, :string
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
  end
end
