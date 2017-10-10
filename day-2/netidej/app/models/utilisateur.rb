class Utilisateur < ApplicationRecord
  has_secure_password

  has_many :commandes

  validates :email,
    presence:   { message: "Grand .. on en a besoin pour la suite" },
    uniqueness: { message: "Tu te prends pour l'autre ?" }

  def self.authenticate(email, password)
    me = where(email: email).first
    me && me.authenticate(password)
  end
end
