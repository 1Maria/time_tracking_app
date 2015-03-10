class TimeEntry < ActiveRecord::Base
  belongs_to :developers
  belongs_to :projects
end
