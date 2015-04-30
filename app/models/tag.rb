class Tag < ActiveRecord::Base
  has_many :ideas_tags
  has_many :ideas, through: :ideas_tags
end
