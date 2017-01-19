class Builders::ProjectBuilder

  def initialize
    @title = "Title Project",
    @start_date = DateTime.now,
    @end_date = DateTime.now + 1.week
  end

  def buildProject
    Project.create(
      title: @title,
      start_date: @start_date,
      end_date: @end_date
    )
  end

  def paramsTitle title
    @title = title
  end

  def paramsStartDate start_date
    @start_date = start_date
  end

  def paramsEndDate end_date
    @end_date = end_date
  end

end
