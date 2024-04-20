# frozen_string_literal: true

require 'rails_helper'
require 'chatgpt_code_reviewer'

RSpec.describe ChatgptCodeReviewer do
  describe 'review_code' do
    subject(:review_code) { described_class.new.review_code(file_path, diff) }

    # NOTE: file_path set self file to assure always exist
    let(:file_path) { __FILE__ }
    let(:diff) do
      <<~DIFF
        diff --git a/app/controllers/posts_controller.rb b/app/controllers/posts_controller.rb
        index cae4a20..b9e4be5 100644
        --- a/app/controllers/posts_controller.rb
        +++ b/app/controllers/posts_controller.rb
        @@ -2,7 +2,13 @@

         class PostsController < ApplicationController
           def index
        -    @posts = Post.all.order(id: :desc)
        +    @posts = Post.all
        +    pp hoge
             render json: @posts
           end
        +
        +  def show
        +    @post = Post.find(params[:id])
        +    render json: @post
        +  end
         end
      DIFF
    end

    let(:mock_client) { instance_double(OpenAI::Client) }

    before do
      allow(ENV).to receive(:fetch).with('OPENAI_API_KEY').and_return('sk-xxxxxxxxxxxxxxxxxxxxxx')
      allow(OpenAI::Client).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:chat).and_return(
        { 'id' => 'xxxxxxxxxxxxxxxxxxxxxx',
          'object' => 'chat.completion',
          'created' => 1_680_442_458,
          'model' => 'gpt-3.5-turbo-0301',
          'usage' => { 'prompt_tokens' => 366, 'completion_tokens' => 32, 'total_tokens' => 398 },
          'choices' =>
           [{ 'message' =>
              { 'role' => 'assistant',
                'content' =>
                'app/controllers/posts_controller.rb:5-6: It seems like the line with `pp hoge` is a debugging statement that should be removed before deployment.' },
              'finish_reason' => 'stop',
              'index' => 0 }] }
      )
    end

    it 'returns review' do
      expect_result = 'app/controllers/posts_controller.rb:5-6: It seems like the line with `pp hoge` is a debugging statement that should be removed before deployment.'
      expect(review_code).to eq(expect_result)
    end
  end
end
