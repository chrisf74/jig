json.id @book.id
json.name @book.name
json.topics @book.topics do |topic|
  json.id topic.slug
  json.name topic.name
end