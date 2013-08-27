class Drawing < ActiveRecord::Base
  has_many :revisions
end
