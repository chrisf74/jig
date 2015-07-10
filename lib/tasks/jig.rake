namespace :jig do
	desc "Drop the DB, create a new one and seed it"
	task :new_db do
		system("rake db:drop db:create db:migrate db:seed RAILS_ENV=development")
	end
end