json.extract! quiz_answer, :id, :content, :correct, :created_at, :updated_at
json.url quiz_answer_url(quiz_answer, format: :json)
