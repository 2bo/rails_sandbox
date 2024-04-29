# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts' do
  subject(:graphql_request) { post '/graphql', params: { query:, variables: } }

  let(:query) do
    <<~GRAPHQL
      query($id: ID!) {
        post(id: $id) {
          body
          createdAt
          id
          title
        }
      }
    GRAPHQL
  end
  let(:variables) do
    { id: post_id }
  end

  context 'when post exists' do
    let!(:sample_post) { create(:post) }
    let(:post_id) { sample_post.id }

    it 'returns post' do
      graphql_request
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data][:post]).to eq(
        {
          id: sample_post.id.to_s,
          title: sample_post.title,
          body: sample_post.body,
          createdAt: sample_post.created_at.iso8601,
        }
      )
      expect(parsed_response[:errors]).to be_nil
    end
  end

  context 'when post does not exist' do
    let(:post_id) { 0 }

    before do
      create(:post)
    end

    it 'returns error' do
      graphql_request
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data]).to be_nil
      expect(parsed_response[:errors].first[:message]).to eq('Post not found')
    end
  end
end
