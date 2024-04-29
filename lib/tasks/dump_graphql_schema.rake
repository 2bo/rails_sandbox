# frozen_string_literal: true

require 'graphql/rake_task'

# https://graphql-ruby.org/api-doc/1.9.12/GraphQL/RakeTask.html#initialize-instance_method
# e.g. $ bundle exec rake graphql:schema:idl
GraphQL::RakeTask.new(schema_name: 'MyappSchema', directory: 'app/graphql', idl_outfile: 'myapp_schema.graphql')
