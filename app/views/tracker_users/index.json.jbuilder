json.array!(@tracker_users) do |tracker_user|
  json.extract! tracker_user, :id, :email, :is_admin
  json.url tracker_user_url(tracker_user, format: :json)
end
