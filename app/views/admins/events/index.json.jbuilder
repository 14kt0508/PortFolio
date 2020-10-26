
json.array!(@events) do |event|
  json.extract! event, :id, :title, :body
  json.start event.time
  json.end event.time
  json.url event_url(event, format: :html)
endሀ