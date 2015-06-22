class Goal < ActiveRecord::Base
  validates :user_id, :content, :goal_type, :goal_status, presence: true

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :comments_received,
    class_name: "GoalComment",
    foreign_key: :subject_id,
    primary_key: :id

  

end
