class CreateDemandes < ActiveRecord::Migration[5.1]
  def change
    create_table :demandes do |t|
      t.references :utilisateur, foreign_key: true
      t.date :debut
      t.date :fin
      t.string :nb_jours
      t.string :type_conges
      t.string :motif
      t.boolean :acceptee

      t.timestamps
    end
  end
end
