# frozen_string_literal: true

require('rails_helper')

RSpec.describe(User, type: :model) do
  describe 'Validates' do
    context 'with valid factory' do
      let(:user) { build(:user) }
      it { expect(user).to(be_valid) }
    end
  end
end
