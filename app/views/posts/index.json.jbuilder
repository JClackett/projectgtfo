json.array!(@posts) do |post|
  json.extract! post, :id, :title, :text, :user_id, :video
  json.url post_url(post, format: :json)
end
