require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = Factory.create(:user)
  end

  test "should return a string" do
    assert_equal "#{@user.name} (#{@user.initials}) <#{@user.email}>", @user.to_s
  end

  test "should set a flag if user created by dynamic finder" do
    user = User.find_or_create_by_email(@user.email) do |u|
      u.was_created = true
    end
    assert !user.was_created

    user = User.find_or_create_by_email('non_existent@example.com') do |u|
      u.was_created = true
    end
    assert user.was_created
  end

  test "should not save a user without a name" do
    @user.name = ''
    assert !@user.save
  end

  test "should not save a user without initials" do
    @user.initials = ''
    assert !@user.save
  end

  test "should return json" do
    attrs = ["id", "name", "initials", "email"]
    assert_equal(attrs.count, @user.as_json['user'].keys.count)
  end

  test "should update activity" do
    @actor = Factory.build(:user)
    @actor.email = "q@w.com"
    @actor.save
    @project = Factory.create(:project)
    assert_equal @user.update_activity(@actor, @project).class, Activity
  end

  test "should update activity2" do
    assert_equal @user.feeds, []
  end
end
