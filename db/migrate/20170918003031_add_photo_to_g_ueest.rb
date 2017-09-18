class AddPhotoToGUeest < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :photo, :string
  end
end
