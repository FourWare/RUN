json.extract! route, :id, :title, :description, :from_lat, :from_lng, :to_lat, :to_lng, :waypoints, :departure, :cost, :created_at, :updated_at
json.url route_url(route, format: :json)
