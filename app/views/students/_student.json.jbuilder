json.extract! student, :id, :firstName, :lastName, :created_at, :updated_at
json.url student_url(student, format: :json)
