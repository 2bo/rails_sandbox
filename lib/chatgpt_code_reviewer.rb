# frozen_string_literal: true

require 'openai'

class ChatGPTCodeReviewer
  def initialize
    access_token = ENV.fetch('OPENAI_API_KEY')
    @client = OpenAI::Client.new(access_token:)
  end

  def review_code(file_path, diff)
    file_content = File.read(file_path)
    prompt = make_prompt(file_content, diff)
    request_to_openai(prompt)
  end

  private

  def request_to_openai(prompt)
    response = @client.chat(
      # https://platform.openai.com/docs/api-reference/chat/create
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [{ role: 'user', content: prompt }]
      }
    )
    response.dig('choices', 0, 'message', 'content')
  end

  def make_prompt(file_content, diff)
    <<~PROMPT
      I want you to act as a Ruby, Ruby on Rails expert code reviewer.
      I enter all the content for one rb file.
      In addition, enter the git diff results of the file changes.
      All contents are entered following "All contents:".
      The git diff results are entered following "Diff:".
      The format of the git diff is "+" at the beginning of added lines and "-" at the end of deleted lines.
      After considering The "All Contents:", return the code review against the "Diff:"
      Reviews for specific lines should begin with the format "directories/filename:row number" to indicate the line number of the file.
      An example of the format is "app/models/hello.rb:2".

      All contents:
      ```
      #{file_content}
      ```

      Diff:
      ```
      #{diff}
      ```
    PROMPT
  end
end
