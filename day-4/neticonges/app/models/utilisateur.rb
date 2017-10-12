class Utilisateur < ApplicationRecord

  has_many :demandes

  validates :email,
    presence: true,
    uniqueness: true

end
