if User.count > 0
  print "Reload users? [yN] "
  confirm = STDIN.gets.strip
  User.destroy_all if confirm.eql?('y')
end    
users = [{
  email: 'testuser@example.com',
  password: 'testuser',
  password_confirmation: 'testuser'
}]
User.create(users)