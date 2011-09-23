require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
    setup do
      @user = Factory.create(:user)
      @actor = Factory.build(:user)
      @actor.email = "q@w.com"
      @actor.save
      @project = Factory.create(:project)
      @activity = Activity.create(:actor_id => @actor.id, :user_id => @user.id, :project_id => @project.id, :kind => "user")
    end

    #Association testing
    test "should return @user object" do
      assert_equal @user, @activity.user
    end

    test "should return @actor object" do
      assert_equal @actor, @activity.actor
    end
#
    test "should return @project object" do
      assert_equal @project, @activity.project
    end

end
