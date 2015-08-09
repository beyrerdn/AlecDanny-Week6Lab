class ChangeColumnsOnUserAndProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :username
    remove_column :profiles, :bio
    remove_column :profiles, :image
    remove_column :profiles, :first_name
    remove_column :profiles, :last_name
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :image, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
