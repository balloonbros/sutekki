class Idea < ActiveRecord::Base
  has_and_belongs_to_many :labels

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true

  scope :published, -> { where(published: true) }
  scope :disabled, -> { where(published: false) }

  def has_label?(label_id)
    self.labels.any? { |label| label.id == label_id }
  end

  def disable
    update(published: false)
  end
end
