class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :body
      t.belongs_to :creative

      t.timestamps
    end
  end
end
