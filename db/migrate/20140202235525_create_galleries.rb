class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_column :users, :gallery_id, :integer
  end
end
