# frozen_string_literal: true

# app/controllers/concerns/work_history_now.rb
module WorkHistoryNow
  extend ActiveSupport::Concern

  # Set new work history with current time
  def set_work_history_now
    work_history_config
  end

  private

  def work_history_config
    @work_history = WorkHistory.find_by(user_id: current_user.id, starts_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    if @work_history.blank?
      @work_history = WorkHistory.new
      @work_history.user_id = current_user.id
    elsif @work_history.ends_at.present?
      @work_history = nil
    end
  end
end
