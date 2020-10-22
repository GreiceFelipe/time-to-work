# frozen_string_literal: true

require('rails_helper')

RSpec.describe(WorkHistory, type: :model) do # rubocop:disable Metrics/BlockLength
  describe 'Validates' do
    context 'with valid factory' do
      let(:valid_work_history) { build(:work_history) }
      it { expect(valid_work_history).to(be_valid) }
    end
  end

  describe 'set lunch time' do
    let(:starts_at) { Faker::Time.forward(days: 23, period: :morning) }

    context 'when ends_at is given' do
      let(:work_history) { create(:work_history, starts_at: starts_at, ends_at: starts_at + 9.hours) }
      let(:lunch_starts) { starts_at + 4.hours }
      let(:lunch_ends) { lunch_starts + 1.hour }

      it { expect(work_history.lunch_starts).to(eq(lunch_starts)) }
      it { expect(work_history.lunch_ends).to(eq(lunch_ends)) }
    end

    context 'when ends_at is not given' do
      let(:work_history) { create(:work_history, starts_at: starts_at) }

      it { expect(work_history.lunch_starts).to(eq(nil)) }
      it { expect(work_history.lunch_ends).to(eq(nil)) }
    end

    context 'when work_history < 9 hours ' do
      let(:random_hour) { (1..8).to_a }
      let(:work_history) { create(:work_history, starts_at: starts_at, ends_at: starts_at + random_hour.sample.hours) }

      it { expect(work_history.lunch_starts).to(eq(nil)) }
      it { expect(work_history.lunch_ends).to(eq(nil)) }
    end
  end

  describe 'set work time' do # rubocop:disable Metrics/BlockLength
    let(:starts_at) { Faker::Time.forward(days: 23, period: :morning) }

    context 'when work_history has lunch time' do
      let(:random_hour) { Array(1..5).sample }
      let(:lunch_starts) { starts_at + 4.hours }
      let(:work_time) { 9 - random_hour }
      let(:work_history) do
        create(
          :work_history,
          starts_at: starts_at,
          lunch_starts: lunch_starts,
          lunch_ends: lunch_starts + random_hour.hours,
          ends_at: starts_at + 9.hours
        )
      end

      it { expect(work_history.worked_hours).to(eq(work_time)) }
    end

    context 'when work_history has no lunch time' do
      let(:work_history) do
        create(
          :work_history,
          starts_at: starts_at,
          ends_at: starts_at + 5.hours
        )
      end

      it { expect(work_history.worked_hours).to(eq(4)) }
    end
  end
end
