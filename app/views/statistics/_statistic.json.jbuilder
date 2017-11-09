json.extract! statistic, :id, :routes_per_day, :users_created_per_day, :cars_per_day, :bikes_per_day, :users_in_routes_per_day, :created_at, :updated_at
json.url statistic_url(statistic, format: :json)
