#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Questbox::Application.load_tasks


# Mongo patch to enable deployment
pt = Rake::Task['assets:environment']
Rake.application.send(:eval, "@tasks.delete('assets:environment')")

namespace :assets do
  task :environment do
    module ::Mongoid
      def load!(config_file)
        puts "Skipping connection to Mongo DB"
      end
    end

    pt.execute
  end
end
