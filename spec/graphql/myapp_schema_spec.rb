# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyappSchema do
  describe 'GraphQL Schema file' do
    it 'is up to date' do
      current_defn = described_class.to_definition
      printout_defn = Rails.root.join('app/graphql/myapp_schema.graphql').read
      # NOTE: exec rake if failed
      # $ bundle exec rake graphql:schema:idl
      expect(current_defn).to eq(printout_defn), 'Update the printed schema with `bundle exec rake dump_schema`'
    end
  end
end
