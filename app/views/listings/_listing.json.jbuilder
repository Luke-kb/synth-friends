json.extract! listing, :id, :title, :short_description, :long_description, :price, :year_of_manufacture, :start_date, :end_date, :category_id, :brand_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
