json.array!(@ideas_tags) do |ideas_tag|
  json.extract! ideas_tag, :id, :idea_id, :tag_id
  json.url ideas_tag_url(ideas_tag, format: :json)
end
