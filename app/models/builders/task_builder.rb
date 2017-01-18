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

  def without_start_date
    @start_date =  nil
    self
  end

  def without_start_date
    @end_date =  nil
    self
  end

  def with_project project
    @project_id = project
    self
  end

  def with_description
    @description = 'Insert description for task'
    self
  end

  def with_priority priority
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
