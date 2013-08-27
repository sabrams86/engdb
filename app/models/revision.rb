class Revision < ActiveRecord::Base
  belongs_to :drawing
  belongs_to :ecn
end
