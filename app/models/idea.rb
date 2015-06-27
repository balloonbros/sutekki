class Idea < ActiveRecord::Base
  has_and_belongs_to_many :labels

  def has_label?(label_id)
    self.labels.any? { |label| label.id == label_id }
  end
end
