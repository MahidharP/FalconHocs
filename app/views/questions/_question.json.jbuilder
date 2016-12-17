json.extract! question, :id, :title, :status, :question_category_id, :created_at, :updated_at
json.url question_url(question, format: :json)