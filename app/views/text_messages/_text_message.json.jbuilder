json.extract! text_message, :id, :message, :topic, :created_at, :updated_at
json.url text_message_url(text_message, format: :json)
