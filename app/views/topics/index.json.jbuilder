json.array! @topics.map do |topic|
  json.id topic.slug
  json.book_id topic.book_slug
  json.name topic.name
end