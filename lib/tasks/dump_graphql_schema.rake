# frozen_string_literal: true

namespace :dump_graphql_schema do
  desc 'Dump GraphQL schema to a file'
  task dump: :environment do
    schema_defn = MyappSchema.to_definition
    schema_path = 'app/graphql/myapp_schema.graphql'
    Rails.root.join(schema_path).write(schema_defn)
    puts "Updated #{schema_path}"
  end
end
