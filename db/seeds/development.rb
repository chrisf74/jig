# Seed users.
if User.count > 0
  print "Reload users? [yN] "
  confirm = STDIN.gets.strip
  User.destroy_all if confirm.eql?('y')
end    
user_hash = [{
  email: 'testuser@example.com',
  password: 'testuser',
  password_confirmation: 'testuser'
}]
User.create(user_hash)

# Seed books.
book_file = File.read('content/books.json')
book_hash = JSON.parse(book_file)
Book.create(book_hash)

# Seed topics.
Dir['content/bk*_ch*.json'].each do |topic_file|
	topic_file = File.read(topic_file)
	topic_hash = JSON.parse(topic_file)
	Topic.create(
		book_id: topic_hash['book_id'],
		name: topic_hash['name'],
		slug: topic_hash['slug'])
end