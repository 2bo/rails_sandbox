# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    post
    content { 'content' }
  end
end
