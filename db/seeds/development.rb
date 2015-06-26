# Seed users.
if User.count > 0
  print "Reload users? [yN] "
  confirm = STDIN.gets.strip
  User.destroy_all if confirm.eql?('y')
end    
user_hash = [{
  first_name: 'Chuck',
  last_name: 'Norris',
  email: 'cnorris@thebeard.com',
  password: 'roundhouse',
  password_confirmation: 'roundhouse'
}]
User.create(user_hash)

# Seed books.
Dir['content/bk*.json'].each do |book_file|
  book_file = File.read(book_file)
  book_hash = JSON.parse(book_file)
  Book.create(
    name: book_hash['name'],
    slug: book_hash['id'])
end

# Seed topics.
Dir['content/bk*_ch*.json'].each do |topic_file|
	topic_file = File.read(topic_file)
	topic_hash = JSON.parse(topic_file)
	Topic.create(
		book_id: topic_hash['book_id'],
		name: topic_hash['name'],
		slug: topic_hash['id'])
end