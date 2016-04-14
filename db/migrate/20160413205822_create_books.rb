class CreateBooks < ActiveRecord::Migration
  def change

    create_table :books do |t|
      t.string :title
      t.text :genre
      t.text :contents
      # t.string :image
      t.boolean :graft, :default => false
      t.belongs_to :user_id, index: true 

      t.timestamps null: false
    end
  end
end
