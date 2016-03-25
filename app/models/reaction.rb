class Reaction < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :idea_id, presence: true
  validates :idea_id, uniqueness: {scope: [:user_id, :action]}
  validates :user_id, presence: true
  validates :action, presence: true
end
