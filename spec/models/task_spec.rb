require 'rails_helper'

RSpec.describe Task, type: :model do

  project = Builders::ProjectBuilder.new.build

    it " belongs_to project" do
      project = described_class.reflect_on_association(:project)
      expect(project.macro).to eq :belongs_to
    end

  task = Builders::TaskBuilder.new.paramProject(project.id).paramPriority(:high).build

    it "is valid with valid attributes" do
      expect(task).to be_valid
    end
    it "is not valid without project" do
      task_witout_project = Builders::TaskBuilder.new.build
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
      project = Builders::ProjectBuilder.new.build
      task = Builders::TaskBuilder.new.paramPriority(:mediun).paramProject(project.id).build
      expect(task.priority).to eq Priority::PRIORITY_MAP[:mediun]
    end

    it "is valid when priority is LOW" do
      project = Builders::ProjectBuilder.new.build
      task = Builders::TaskBuilder.new.paramPriority(:low).paramProject(project.id).build
      expect(task.priority).to eq Priority::PRIORITY_MAP[:low]
    end

    it "is not valid when task.end_date is bigger than Project.end_date" do
      project = Builders::ProjectBuilder.new.build
      task = Builders::TaskBuilder.new.paramEndDate(DateTime.now + 2.week).paramProject(project.id).build
      expect(task).to_not be_valid
    end

    it "is not valid when task.star_date is less than Project.start_date" do
      project = Builders::ProjectBuilder.new.build
      task = Builders::TaskBuilder.new.paramStartDate(DateTime.now - 2.week).paramProject(project.id).build
      expect(task).to_not be_valid
    end

    it "is valid when task is create with status is Open" do
      project = Builders::ProjectBuilder.new.build
      task = Builders::TaskBuilder.new.paramProject(project.id).build
      expect(task.status).to eq "Open"
    end

    it "is valid when status is Closed" do
      project = Builders::ProjectBuilder.new.build
      task = Builders::TaskBuilder.new.paramProject(project.id).paramStatus(closed).build
      expect(task.status).to eq "Closed"
    end
    it "is valid when status is Stopped" do
      project = Builders::ProjectBuilder.new.build
      task = Builders::TaskBuilder.new.paramProject(project.id).paramStatus(stopped).build
      expect(task.status).to eq "Stopped"
    end


end
