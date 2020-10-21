# frozen_string_literal: true

# app/models/concerns/hours_controllable.rb
module HoursControllable
  extend ActiveSupport::Concern

  # Call default_hours_config method if ends_at is present
  def update_default_hours
    default_hours_config if ends_at.present?
  end

  # Converts a worked_hours (integer) to a Time value
  def worked_hours_to_time
    Time.at(worked_hours * 1.hour).strftime('%H:%M')
  end

  # validate if work_history already exists
  def work_history_date
    work_history = WorkHistory.find_by(user_id: user_id, starts_at: starts_at.beginning_of_day..starts_at.end_of_day)

    return if work_history.blank?

    errors.add(:base, 'Não é permitido exitir dois ponto no mesmo dia') if work_history.ends_at.present?
  end

  # set hours default config
  def default_hours_config
    lunch_hours_config

    total_hours = (ends_at - starts_at) / 1.hour

    if lunch_starts.nil? && lunch_ends.nil?
      self.worked_hours = total_hours
    else
      lunch_time = (lunch_ends - lunch_starts) / 1.hour
      self.worked_hours = total_hours - lunch_time
    end
  end

  # set lunch hours config
  def lunch_hours_config
    self.lunch_starts = starts_at + 4.hours if lunch_starts.nil? && ends_at >= starts_at + 6.hours

    self.lunch_ends = lunch_starts + 1.hour if lunch_ends.nil? && lunch_starts.present?
  end
end
