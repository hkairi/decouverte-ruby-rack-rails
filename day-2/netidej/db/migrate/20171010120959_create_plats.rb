class CreatePlats < ActiveRecord::Migration[5.1]
  def change
    create_table :plats do |t|
      t.string :nom

      t.timestamps
    end
  end
end
