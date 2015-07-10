json.id @topic_data['slug']
json.book_id @topic_data['book_slug']
json.name @topic_data['name']
json.content @topic_data['content']
json.set! :book do
	json.partial! 'books/show', {
		book: @topic.book
	}
end