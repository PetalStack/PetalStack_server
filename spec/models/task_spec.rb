require 'rails_helper'

RSpec.describe Task, type: :model do

  subject {
    described_class.new(
      title: "Title",
      start_date: DateTime.now,
      end_date: DateTime.now + 1.week
    )
  }

  describe " testing attributes" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
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
