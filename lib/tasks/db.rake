namespace :db do
  desc "Create db, load schema, and seed"
  task reload: [ 'db:create', 'db:schema:load', 'db:seed'] do
    puts 'Database created and seeded'
  end

end
