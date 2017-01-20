require 'rails_helper'

RSpec.describe User, type: :model do

Builders::UserBuilder.new.paramEmail('test@test.com').build

  it "is valid with valid attributes" do
      user = Builders::UserBuilder.new.build
      expect(user).to be_valid
  end
  it "is not valid without name" do
    user = Builders::UserBuilder.new.build
    user.name = nil
    expect(user).to_not be_valid
  end
  it "is not valid without email" do
    user = Builders::UserBuilder.new.build
    user.email = nil
    expect(user).to_not be_valid
  end
  it "is not valid without password" do
    user = Builders::UserBuilder.new.build
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is not valid when the email is already registered" do
    user = Builders::UserBuilder.new.build
    expect{user}.to raise_error
  end






end
