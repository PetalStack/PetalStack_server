require 'rails_helper'

RSpec.describe Task, type: :model do

  project = Builders::ProjectBuilder.new.buildProject

    it " belongs_to project" do
      project = described_class.reflect_on_association(:project)
      expect(project.macro).to eq :belongs_to
    end

  task = Builders::TaskBuilder.new.paramsProject(project.id).paramsPriority(:high).buildTask

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
      project = Builders::ProjectBuilder.new.buildProject
      task = Builders::TaskBuilder.new.paramsPriority(:mediun).paramsProject(project.id).buildTask
      expect(task.priority).to eq Priority::PRIORITY_MAP[:mediun]
    end

    it "is valid when priority is LOW" do
      project = Builders::ProjectBuilder.new.buildProject
      task = Builders::TaskBuilder.new.paramsPriority(:low).paramsProject(project.id).buildTask
      expect(task.priority).to eq Priority::PRIORITY_MAP[:low]
    end

    it "is not valid when task.end_date is bigger than Project.end_date" do
      project = Builders::ProjectBuilder.new.buildProject
      task = Builders::TaskBuilder.new.paramsEndDate(DateTime.now + 2.week).paramsProject(project.id).buildTask
      expect(task).to_not be_valid
    end

    it "is not valid when task.star_date is less than Project.start_date" do
      project = Builders::ProjectBuilder.new.buildProject
      task = Builders::TaskBuilder.new.paramsStartDate(DateTime.now - 2.week).paramsProject(project.id).buildTask
      expect(task).to_not be_valid
    end

    it "is valid when task is create with status is Open" do
      project = Builders::ProjectBuilder.new.buildProject
      task = Builders::TaskBuilder.new.paramsProject(project.id).buildTask
      expect(task.status).to eq "Open"
    end

    it "is valid when status is Closed" do
      project = Builders::ProjectBuilder.new.buildProject
      task = Builders::TaskBuilder.new.paramsProject(project.id).paramsStatus(:closed).buildTask
      expect(task.status).to eq "Closed"
    end
    it "is valid when status is Stopped" do
      project = Builders::ProjectBuilder.new.buildProject
      task = Builders::TaskBuilder.new.paramsProject(project.id).paramsStatus(:stopped).buildTask
      expect(task.status).to eq "Stopped"
    end


end
