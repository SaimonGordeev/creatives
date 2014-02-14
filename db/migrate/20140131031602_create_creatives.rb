class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.string :title
      t.string :description
      t.belongs_to :user
      t.timestamp :created_at

      t.timestamps
    end
  end
end
