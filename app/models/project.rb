class Project < ApplicationRecord
    has_many :tasks
    validates_presence_of :title, :start_date, :end_date
end
