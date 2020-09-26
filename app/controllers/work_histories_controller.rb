class WorkHistoriesController < ApplicationController
    before_action :set_work_history, only: %i[edit update]
    before_action :set_work_history_now, only: %i[now check_now]

    def index
      @work_histories = WorkHistory.where(user_id: current_user.id)  
    end

    def new
        @work_history = WorkHistory.new
    end

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

    def edit; end

    def update
        respond_to do |format|
            if @work_history.update(work_history_params)
                format.html { redirect_to work_histories_path, notice: 'Ponto editado com sucesso.' }
            else
                format.html { render :edit }
            end
        end
    end

    def now; end

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

    def set_work_history
        @work_history = WorkHistory.find_by(id: params[:id], user_id: current_user)
    end

    def set_work_history_now
        @work_history = WorkHistory.find_by(user_id: current_user.id, starts_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) 
        if @work_history.blank? 
            @work_history = WorkHistory.new 
            @work_history.user_id = current_user.id
        elsif @work_history.ends_at.present?
            @work_history = nil
        end
    end

    def work_history_params
        params.require(:work_history).permit(:starts_at, :ends_at, :lunch_starts, :lunch_ends)
    end
end
