class CreateGoalComment < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.text :comment
      t.integer :commenter_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
