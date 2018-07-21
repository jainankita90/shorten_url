json.extract! short_link, :id, :main_url, :sanitize_url, :hit_count, :slug, :expire_date, :created_at, :updated_at
json.url short_link_url(short_link, format: :json)
