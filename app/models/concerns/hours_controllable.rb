# frozen_string_literal: true

module HoursControllable
  extend ActiveSupport::Concern

  def update_default_hours
    if ends_at.present?
      self.lunch_starts = starts_at + 4.hours if lunch_starts.nil? && ends_at >= starts_at + 6.hours

      self.lunch_ends = lunch_starts + 1.hour if lunch_ends.nil? && lunch_starts.present?

      total_hours = (ends_at - starts_at) / 1.hour

      if lunch_starts.nil? && lunch_ends.nil?
        self.worked_hours = total_hours
      else
        lunch_time = (lunch_ends - lunch_starts) / 1.hour
        self.worked_hours = total_hours - lunch_time
      end
    end
  end

  def worked_hours_to_time
    Time.at(worked_hours * 1.hour).utc.strftime('%H:%M')
  end

  def work_history_date
    work_history = WorkHistory.find_by(user_id: user_id, starts_at: starts_at.beginning_of_day..starts_at.end_of_day)

    if work_history.present?
      errors.add(:base, 'Não é permitido exitir dois ponto no mesmo dia') if work_history.ends_at.present?
    end
  end
end
