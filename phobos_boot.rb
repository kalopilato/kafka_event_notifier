# Use this file to load your code
puts <<~ART
  ______ _           _
  | ___ \\ |         | |
  | |_/ / |__   ___ | |__   ___  ___
  |  __/| '_ \\ / _ \\| '_ \\ / _ \\/ __|
  | |   | | | | (_) | |_) | (_) \\__ \\
  \\_|   |_| |_|\\___/|_.__/ \\___/|___/
ART
puts "
phobos_boot.rb - find this file at #{File.expand_path(__FILE__)}

"
require 'bundler/setup'
require 'phobos_db_checkpoint'
require './lib/event_handler'
PhobosDBCheckpoint.configure(pool_size: 10)
PhobosDBCheckpoint.load_tasks
Rake.application['db:create'].invoke
Rake.application['db:migrate'].invoke

PhobosDBCheckpoint.configure(pool_size: 10)
