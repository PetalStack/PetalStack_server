class Builders::TaskBuilder

  ##attr_reader :title, :description

  def initialize
    @title = "Title Task",
    @start_date =  DateTime.now,
    @end_date = DateTime.now + 1.week
  end

  def without_title
    @title = 'Title Task'
    self
  end

  def paramsStartDate start_date
    @start_date =  start_date
    self
  end

  def paramsEndDate end_date
    @end_date =  end_date
    self
  end

  def paramsProject project
    @project_id = project
    self
  end

  def with_escription
    @description = 'Insert description for task'
    self
  end

  def paramsPriority priority
    @priority = Priority::PRIORITY_MAP[priority]
    self
  end

  def buildTask

    Task.create(
      title: @title,
      start_date: @start_date,
      end_date: @end_date,
      project_id: @project_id,
      priority:@priority
    )
  end



end
