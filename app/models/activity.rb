class Activity < ActiveRecord::Base
  belongs_to :story
  belongs_to :project
  belongs_to :user
  belongs_to :actor, :class_name => "Activity", :foreign_key => :actor_id
end
