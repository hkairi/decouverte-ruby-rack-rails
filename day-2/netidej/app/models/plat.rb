class Plat < ApplicationRecord
  has_many :commandes

  validates :nom,
    uniqueness: { message: "ce nom existe déjà." },
    presence: { message: "djo ... un peu de sérieux" }

  scope :du_jour, -> { where(date: Date.today) }

  rails_admin do
    object_label_method :nom

    list do
      field :id
      field :nom
      field :commandes
    end
  end
end
