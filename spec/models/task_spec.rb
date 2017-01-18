require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:project) { Project.create(
    title: "Title Project",
    start_date: DateTime.now,
    end_date: DateTime.now + 1.week
    )
  }

  let(:subject) { Task.create(
    title:"Title",
    start_date:  DateTime.now,
    end_date: DateTime.now + 1.week,
    project_id: project.id
  )}


  describe "Associations" do
    it " belongs_to project" do
      project = described_class.reflect_on_association(:project)
      expect(project.macro).to eq :belongs_to
    end
  end

  describe " testing attributes" do
    it "is valid with valid attributes" do
      puts project.id
      expect(subject).to be_valid
    end
    it "is not valid without project" do
      subject.project = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a start_date" do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a end_date" do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end
  end


end
