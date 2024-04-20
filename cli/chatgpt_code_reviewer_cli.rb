# frozen_string_literal: true

require_relative '../lib/chatgpt_code_reviewer'

# Usage: git diff file_path | ruby cli/chatgpt_code_reviewer_cli.rb file_path
file_path = ARGV[0]
diff = $stdin.read

puts ChatgptCodeReviewer.new.review_code(file_path, diff)
