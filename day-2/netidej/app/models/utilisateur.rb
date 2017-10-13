class Utilisateur < ApplicationRecord
  has_secure_password

  has_many :commandes

  #VALID_EMAIL_REGEX = /\A[\w+\-.]{1,50}+@[a-z\d\-.]{2,50}+\.[a-z]{2,6}+\z/i
  # pour n'accepter que les adresses mail @neticoa.fr
  VALID_EMAIL_REGEX = /\A[\w+\-.]{1,50}+@neticoa.[fr|sn]/i

  validates :email,
    presence:   { message: ' obligatoire ' },
    format:     { with: VALID_EMAIL_REGEX, message: ' invalide. Seules les adresses @neticoa.(fr|sn) sont acceptées.'},
    uniqueness: { message: ' déjà utilisée.' }

  validates :nom,
    presence: { message: ' obligatoire' },
    format: { with: /\A[a-zA-Z]/i, message: ' seules les lettres sont acceptées. ' },
    length:   {
      minimum: 3,
      maximum: 30,
      too_long: ' trop long.',
      too_short: ' trop court. '
    }

  def self.authenticate(email, password)
    me = where(email: email).first
    me && me.authenticate(password)
  end

  rails_admin do
    object_label_method :nom
    list do
      field :id
      field :nom
      field :email
      field :commandes
    end

    show do
      field :id
      field :nom
      field :email
      field :commandes
    end

    edit do
      field :nom
    end
  end
end
