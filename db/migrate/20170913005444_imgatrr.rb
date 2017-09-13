class Imgatrr < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :img, :string
  end
end
