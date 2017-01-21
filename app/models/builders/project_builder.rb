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

  def get_valid_obj
    project = {
      :title => 'Title Project',
      :start_date => DateTime.now,
      :end_date => DateTime.now + 1.week
      }
      project
  end
  def get_invalid_obj
    project = {
      :title => '',
      :start_date => DateTime.now,
      :end_date => DateTime.now + 1.week
      }
      project
  end

  def get_new_params
    project = {
      :title => 'New Title',
      :start_date => DateTime.now + 2.week,
      :end_date => DateTime.now + 3.week
      }
      project
  end

end
