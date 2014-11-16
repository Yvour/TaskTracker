json.array!(@tracker_projects) do |tracker_project|
  json.extract! tracker_project, :id, :name, :description
  json.url tracker_project_url(tracker_project, format: :json)
end
