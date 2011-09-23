class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user_id
      t.integer :actor_id
      t.references :project
      t.references :story
      t.string :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
