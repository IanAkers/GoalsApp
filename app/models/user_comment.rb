class UserComment < ActiveRecord::Base
  validates :commenter_id, :subject_id, :comment, presence: true

  belongs_to :commenter,
    class_name: "User",
    foreign_key: :commenter_id,
    primary_key: :id

  belongs_to :subject,
    class_name: "User",
    foreign_key: :subject_id,
    primary_key: :id

end
