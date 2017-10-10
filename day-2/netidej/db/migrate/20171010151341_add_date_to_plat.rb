class AddDateToPlat < ActiveRecord::Migration[5.1]
  def change
    add_column :plats, :date, :date
  end
end
