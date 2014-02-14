class AddLockingForUsers < ActiveRecord::Migration
  def change
    add_column :users, :locking, :boolean, :default => false
  end
end
