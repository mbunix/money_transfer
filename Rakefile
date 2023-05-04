# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.


require_relative "config/application"



Rails.application.load_tasks


namespace :erd do
  desc "Generate an Entity-Relationship Diagram PDF"
  task :generate do
    sh "bundle exec erd --attributes=foreign_keys --filename=erd --markup=none --orientation=vertical --overwrite --title='ERD'"
    sh "dot -Tpdf erd.dot -o erd.pdf"
    puts "ERD generated at #{File.join(Dir.pwd, 'erd.pdf')}"
  end
end
