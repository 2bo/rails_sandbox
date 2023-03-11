# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts' do
  describe 'GET /posts' do
    subject(:request) { get '/posts' }

    let!(:first_post) { create(:post, title: 'first post') }
    let!(:second_post) { create(:post, title: 'second post') }

    it 'return posts order by id desc' do
      request
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response).to eq([
                                      {
                                        id: second_post.id,
                                        title: 'second post',
                                        body: second_post.body,
                                        created_at: second_post.created_at.iso8601(3),
                                        updated_at: second_post.updated_at.iso8601(3)
                                      },
                                      {
                                        id: first_post.id,
                                        title: 'post',
                                        body: first_post.body,
                                        created_at: first_post.created_at.iso8601(3),
                                        updated_at: first_post.updated_at.iso8601(3)
                                      }
                                    ])
    end
  end
end
