json.array! @books.map do |book|
  json.id book.slug
  json.name book.name
end