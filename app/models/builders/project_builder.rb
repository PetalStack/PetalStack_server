class Builders::ProjectBuilder

  def initialize
    @title = 'Title Project',
    @start_date = DateTime.now,
    @end_date = DateTime.now + 1.week
  end

  def build
    Project.create(
      title:@title,
      start_date:@start_date,
      end_date:@end_date
    )
  end

  def paramTitle title
    @title = title
    self
  end

  def paramStartDate start_date
    @start_date = start_date
    self
  end

  def paramEndDate end_date
    @end_date = end_date
    self
  end

  def getObjProject
    project = {
      :title => 'Title Project',
      :start_date => DateTime.now,
      :end_date => DateTime.now + 1.week
      }
      project
  end

end
