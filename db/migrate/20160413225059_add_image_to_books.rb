class AddImageToBooks < ActiveRecord::Migration
  def change
    add_column :books, :image, :json
  end
end
