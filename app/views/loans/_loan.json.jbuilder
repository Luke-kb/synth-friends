json.extract! loan, :id, :listing_id, :start_date, :end_date, :total_cost, :created_at, :updated_at
json.url loan_url(loan, format: :json)
