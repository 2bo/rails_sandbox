# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'graphql/rake_task'

Rails.application.load_tasks
# https://graphql-ruby.org/api-doc/1.9.12/GraphQL/RakeTask.html#initialize-instance_method
GraphQL::RakeTask.new(schema_name: 'MyappSchema', directory: 'app/graphql', idl_outfile: 'myapp_schema.graphql')
