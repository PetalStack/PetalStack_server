class Task < ApplicationRecord

  belongs_to :project, required: true
  validates_presence_of :title , :start_date, :end_date

end



module Priority

  PRIORITY_MAP = {
    high: "HIGH",
    mediun: "MEDIUN",
    low: "LOW"
  }
  def self.[](direction_name)
    DIRECTIONS_MAP[direction_name]
  end
end
