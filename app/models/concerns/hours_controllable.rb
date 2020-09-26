module HoursControllable
    extend ActiveSupport::Concern

    def update_default_hours
        if self.ends_at.present?   
          if self.lunch_starts.nil? && self.ends_at >= starts_at + 4.hours
            self.lunch_starts = starts_at + 4.hours
          end

          if self.lunch_ends.nil? && self.lunch_starts.present?
            self.lunch_ends = self.lunch_starts + 1.hour
          end
          
          total_hours = (self.ends_at - self.starts_at)/ 1.hour

          if self.lunch_starts.nil? && self.lunch_ends.nil?
            self.worked_hours = total_hours
          else
            lunch_time = (self.lunch_ends - self.lunch_starts)/ 1.hour
            self.worked_hours = total_hours - lunch_time
          end   
        end
    end

    def worked_hours_to_time
      Time.at(self.worked_hours*1.hour).utc.strftime("%H:%M")
    end

    def work_history_date
      work_history = WorkHistory.find_by(user_id: self.user_id, starts_at: self.starts_at.beginning_of_day..self.starts_at.end_of_day) 
      
      if work_history.present? 
        if work_history.ends_at.present?
          errors.add(:base, 'Não é permitido exitir dois ponto no mesmo dia')
        end
      end
    end
end