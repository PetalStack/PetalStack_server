require 'rails_helper'

RSpec.describe Task, type: :model do

  project = Project.create(title: "Title Project",start_date: DateTime.now,end_date: DateTime.now + 1.week)

  describe "Associations" do
    it " belongs_to project" do
      project = described_class.reflect_on_association(:project)
      expect(project.macro).to eq :belongs_to
    end
  end

  task = Builders::TaskBuilder.new.with_project(project.id).with_priority(:high).buildTask

  describe " testing attributes" do
    it "is valid with valid attributes" do
      expect(task).to be_valid
    end
    it "is not valid without project" do
      task_witout_project = Builders::TaskBuilder.new.buildTask
      expect(task_witout_project).to_not be_valid
    end
    it "is not valid without title" do
      task.title = nil
      expect(task).to_not be_valid
    end
    it "is not valid without a start_date" do
      task.start_date = nil
      expect(task).to_not be_valid
    end
    it "is not valid without a end_date" do
      task.end_date = nil
      expect(task).to_not be_valid
    end

    it "is valid when priority is HIGH" do
      expect(task.priority).to eq Priority::PRIORITY_MAP[:high]
    end

    it "is valid when priority is MEDIUN" do
      project = Project.create(title: "Title Project",start_date: DateTime.now,end_date: DateTime.now + 1.week)
      task = Builders::TaskBuilder.new.with_priority(:mediun).with_project(project.id).buildTask
      expect(task.priority).to eq Priority::PRIORITY_MAP[:mediun]
    end

    it "is valid when priority is LOW" do
      project = Project.create(title: "Title Project",start_date: DateTime.now,end_date: DateTime.now + 1.week)
      task = Builders::TaskBuilder.new.with_priority(:low).with_project(project.id).buildTask
      expect(task.priority).to eq Priority::PRIORITY_MAP[:low]
    end





  end
6

end
