class Activity < ActiveRecord::Base
  belongs_to :story
  belongs_to :project
  belongs_to :user

  def actor
    User.find self.actor_id
  end
end
