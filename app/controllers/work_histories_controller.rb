# frozen_string_literal: true

# app/controllers/work_histories_controller.rb
class WorkHistoriesController < ApplicationController
  before_action :set_work_history, only: %i[edit update]
  before_action :set_work_history_now, only: %i[now check_now]

  # GET /work_histories
  def index
    @work_histories = WorkHistory.where(user_id: current_user.id)
  end

  # GET /work_histories/new
  def new
    @work_history = WorkHistory.new
  end

  # POST /work_histories
  def create
    @work_history = WorkHistory.new(work_history_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @work_history.save
        format.html { redirect_to work_histories_path, notice: 'Ponto criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /work_histories/:id/edit
  def edit; end

  # PUT    /work_histories/:id
  def update
    respond_to do |format|
      if @work_history.update(work_history_params)
        format.html { redirect_to work_histories_path, notice: 'Ponto editado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /work_histories/now
  def now; end

  # POST /work_histories/check_now
  def check_now
    respond_to do |format|
      if @work_history.update(work_history_params)
        format.html { redirect_to work_histories_path, notice: 'Ponto salvo sucesso.' }
      else
        format.html { render :now }
      end
    end
  end

  private

  # Find work history and set it to share common setup
  def set_work_history
    @work_history = WorkHistory.find_by(id: params[:id], user_id: current_user)
  end

  # Set new work history with current time
  def set_work_history_now
    @work_history = WorkHistory.find_by(user_id: current_user.id, starts_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    if @work_history.blank?
      @work_history = WorkHistory.new
      @work_history.user_id = current_user.id
    elsif @work_history.ends_at.present?
      @work_history = nil
    end
  end

  # Only allow a list of trusted parameters through.
  def work_history_params
    params.require(:work_history).permit(:starts_at, :ends_at, :lunch_starts, :lunch_ends)
  end
end
