json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :description, :priority, :difficulty_level, :status
  json.url ticket_url(ticket, format: :json)
end
