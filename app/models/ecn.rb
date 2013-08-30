class Ecn < ActiveRecord::Base
  has_many :revisions, :dependent => :destroy
  accepts_nested_attributes_for :revisions
end
