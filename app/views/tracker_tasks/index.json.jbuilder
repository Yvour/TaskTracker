json.array!(@tracker_tasks) do |tracker_task|
  json.extract! tracker_task, :id, :cost, :title, :description, :initiator_id, :user_id, :tracker_project_id
  json.url tracker_task_url(tracker_task, format: :json)
end
