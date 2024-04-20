# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment do
  describe '#valid?' do
    describe 'content' do
      subject(:comment) { build(:comment, content:) }

      context 'when content is present' do
        let(:content) { 'content' }

        it { is_expected.to be_valid }
      end

      context 'when content is null' do
        let(:content) { nil }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
