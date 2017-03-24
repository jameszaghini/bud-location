json.extract! session, :id, :platform, :created_at, :updated_at
json.url session_url(session, format: :json)
