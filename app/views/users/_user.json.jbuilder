json.extract! user, :id, :login, :password, :e-mail, :created_at, :updated_at
json.url user_url(user, format: :json)
