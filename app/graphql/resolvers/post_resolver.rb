# frozen_string_literal: true

module Resolvers
  class PostResolver < BaseResolver
    type Types::PostType, null: false
    argument :id, ID
    argument :title, String, required: true

    def resolve(id:, title:)
      ::Post.find(id)
    end
  end
end
