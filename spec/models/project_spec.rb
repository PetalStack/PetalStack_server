require 'rails_helper'

RSpec.describe Project, type: :model do

  project = Builders::ProjectBuilder.new.build

      it "is valid with attributes valid" do
        expect(project).to be_valid
      end
      it "is not valid without title" do
        project.title  = nil
        expect(project).to_not be_valid
      end
      it "is not valid without start_date" do
        project.start_date = nil
        expect(project).to_not be_valid
      end
      it " is not valid without end_date" do
        project.end_date = nil
        expect(project).to_not be_valid
      end
end
