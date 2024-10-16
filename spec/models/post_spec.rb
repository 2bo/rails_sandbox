# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  describe '#valid?' do
    describe 'title' do
      subject(:post) { build(:post, title:) }

      context 'when title is present' do
        let(:title) { 'title' }

        it { is_expected.to be_valid }
      end

      context 'when title is null' do
        let(:title) { nil }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
