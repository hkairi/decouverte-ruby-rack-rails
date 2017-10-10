json.extract! utilisateur, :id, :email, :nom, :password_digest, :created_at, :updated_at
json.url utilisateur_url(utilisateur, format: :json)
