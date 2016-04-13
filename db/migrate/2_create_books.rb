class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :genre
      t.text :contents
      t.belongs_to :user_id

      t.timestamps null: false
    end
  end
end
