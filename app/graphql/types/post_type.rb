# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :body, String
    field :published, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
