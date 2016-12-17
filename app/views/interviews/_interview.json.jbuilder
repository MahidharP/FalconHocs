json.extract! interview, :id, :slot, :type, :description, :remarks, :student_id, :user_id, :interviewer_id, :created_at, :updated_at
json.url interview_url(interview, format: :json)