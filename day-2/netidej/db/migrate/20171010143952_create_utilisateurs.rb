class CreateUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    create_table :utilisateurs do |t|
      t.string :email
      t.string :nom
      t.string :password_digest

      t.timestamps
    end
  end
end
