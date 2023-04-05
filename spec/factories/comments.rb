# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :post
    content { 'content' }
  end
end
