json.extract! expense, :id, :parlamentarian_id, :date_issue, :provider, :value, :url_document, :created_at, :updated_at
json.url expense_url(expense, format: :json)
