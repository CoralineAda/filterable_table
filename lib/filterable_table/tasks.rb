# require 'filterable_table/tasks' to add tasks to the host application.

namespace :filterable_table do

  desc "Install filterable_table"
  task :install do
    dir = Gem.searcher.find('filterable_table').full_gem_path 
    system "rsync -ruv #{dir}/javascripts public/"
    puts
    puts "FilterableTable installation complete."
  end
  
end