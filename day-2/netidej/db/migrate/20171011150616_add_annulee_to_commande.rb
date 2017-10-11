class AddAnnuleeToCommande < ActiveRecord::Migration[5.1]
  def change
    add_column :commandes, :annulee, :boolean, default: false
  end
end
