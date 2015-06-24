json.array! @topics.map do |topic|
  json.name topic.name
  json.id topic.slug
end