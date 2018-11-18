class PublicFigureMigration < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :public_figure, :boolean
  end
end
