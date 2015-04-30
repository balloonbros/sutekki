class Idea < ActiveRecord::Base
  has_many :ideas_tags
  has_many :tags, through: :ideas_tags
end
