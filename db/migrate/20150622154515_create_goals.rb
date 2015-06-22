class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :content
      t.string :goal_type
      t.integer :user_id, null: false
      t.string :goal_status

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
