# frozen_string_literal: true

require('rails_helper')

RSpec.describe(WorkHistory, type: :model) do
  describe 'Validates' do
    context 'with valid factory' do
      let(:work_history) { build(:work_history) }
      it { expect(work_history).to(be_valid) }
    end

    context 'when WorkHistory has no ends_at date' do
      let(:work_history) { create(:work_history) }
      it 'will be default lunch_starts and lunch_ends nil value' do
        expect(work_history.lunch_starts).to(eq(nil))
        expect(work_history.lunch_ends).to(eq(nil))
      end

      it 'will be default worked_hours nil value' do
        expect(work_history.worked_hours).to(eq(nil))
      end
    end

    context 'when WorkHistory has ends_at date' do
      it 'will be default starts and ends time' do
        work_history = create(:work_history)
        work_history.ends_at = work_history.starts_at + 9.hours
        work_history.save

        lunch_starts = work_history.starts_at + 4.hours
        lunch_ends = lunch_starts + 1.hour

        expect(work_history.lunch_starts).to(eq(lunch_starts))
        expect(work_history.lunch_ends).to(eq(lunch_ends))
      end

      it 'will not be default starts and ends time if ends_at < starts_at + 4.hours' do
        work_history = create(:work_history)
        work_history.ends_at = work_history.starts_at + 1.hours
        work_history.save

        expect(work_history.lunch_starts).to(eq(nil))
        expect(work_history.lunch_ends).to(eq(nil))
      end

      it 'will be a predetermined starts and ends time for lunch' do
        work_history =  create(:work_history)

        lunch_starts =  work_history.starts_at + 3.hours
        lunch_ends = lunch_starts + 1.hour

        work_history.ends_at = work_history.starts_at + 9.hours
        work_history.lunch_starts = lunch_starts
        work_history.lunch_ends = lunch_ends
        work_history.save

        expect(work_history.lunch_starts).to(eq(lunch_starts))
        expect(work_history.lunch_ends).to(eq(lunch_ends))
      end

      it 'will be worked_hours value' do
        work_history = create(:work_history)
        work_history.ends_at = work_history.starts_at + 9.hours
        work_history.save

        expect(work_history.worked_hours).to(eq(8.0))
      end
    end

    context 'when it already exists on the same date' do
      it 'will be invalid' do
        work_history = create(:work_history)
        work_history.ends_at = work_history.starts_at + 9.hours
        work_history.save

        invalid_work_history = build(:work_history, starts_at: work_history.starts_at, user_id: work_history.user_id)
        expect(invalid_work_history).not_to(be_valid)
      end
    end
  end
end
