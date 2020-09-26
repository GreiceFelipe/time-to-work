module HoursControllable
    extend ActiveSupport::Concern

    def update_default_hours
        if self.ends_at.present?   
          if self.lunch_starts.nil? && self.lunch_ends.nil?
            self.lunch_starts = starts_at + 4.hours
            self.lunch_ends = self.lunch_starts + 1.hour
          end
    
          lunch_time = (self.lunch_ends - self.lunch_starts)/ 1.hour
          total_hours = (self.ends_at - self.starts_at)/ 1.hour
          self.worked_hours = total_hours - lunch_time
        end
    end
end