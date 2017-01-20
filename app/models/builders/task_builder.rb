class Builders::TaskBuilder

  def initialize
    @title = 'Title Task',
    @start_date =  DateTime.now,
    @end_date = DateTime.now + 1.week
  end

  def build
    Task.create(
      title: @title,
      start_date: @start_date,
      end_date: @end_date,
      project_id: @project_id,
      priority:@priority
    )
  end

  def paramTitle title
    @title = title
    self
  end

  def paramStartDate start_date
    @start_date =  start_date
    self
  end

  def paramEndDate end_date
    @end_date =  end_date
    self
  end

  def paramProject project
    @project_id = project
    self
  end

  def paramDescription descripton
    @description = description
    self
  end

  def paramPriority priority
    @priority = Priority::PRIORITY_MAP[priority]
    self
  end

  def paramStatus status
    @status = status
  end


end
