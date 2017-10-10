class CreateCommandes < ActiveRecord::Migration[5.1]
  def change
    create_table :commandes do |t|
      t.date :date
      t.references :utilisateur, foreign_key: true
      t.references :plat, foreign_key: true

      t.timestamps
    end
  end
end
