json.extract! student, :id, :firstName, :lastName, :user_id, :class_of_student_id, :created_at, :updated_at
json.url student_url(student, format: :json)
