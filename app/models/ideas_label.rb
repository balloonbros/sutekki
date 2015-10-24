class IdeasLabel < ActiveRecord::Base
  validates :idea_id, presence: true
  validates :label_id, presence: true
  validates :idea_id, uniqueness: {scope: :label_id}
end
