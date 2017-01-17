class Task < ApplicationRecord

  validates_presence_of :title , :start_date, :end_date

end
