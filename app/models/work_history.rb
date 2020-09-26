class WorkHistory < ApplicationRecord
  include HoursControllable
  belongs_to :user

  before_save :update_default_hours

  validate :work_history_date, on: :create
end
