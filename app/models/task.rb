class Task < ApplicationRecord

  belongs_to :project, required: true
  validates_presence_of :title , :start_date, :end_date
end
