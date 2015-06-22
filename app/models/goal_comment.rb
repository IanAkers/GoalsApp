class GoalComment < ActiveRecord::Base
  validates :commenter_id, :subject_id, :comment, presence: true

  belongs_to :commenter,
    class_name: "User",
    foreign_key: :commenter_id,
    primary_key: :id

  belongs_to :goal,
    class_name: "Goal",
    foreign_key: :subject_id,
    primary_key: :id

    has_one :goal_owner,
    through: :goal,
    source: :user

end
