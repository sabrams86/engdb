class Ecn < ActiveRecord::Base
  has_many :revisions, :dependent => :destroy
  accepts_nested_attributes_for :revisions, :reject_if => lambda { |a| a[:drawing_id].blank? }, :allow_destroy => true
  
  scope :by_user_name, lambda { |user_name| where(user_name: user_name) unless user_name.nil? }
  scope :by_drawing_number, lambda { |drawing_number| where('drawing_number LIKE ?', "%#{drawing_number}%") unless drawing_number.nil? }
  scope :by_pump_model, lambda { |pump_model| where('product_line LIKE ?', "%#{pump_model}%") unless pump_model.nil? }
  scope :by_frame_size, lambda { |frame_size| join(:drawings, where('frame_size LIKE ?', "%#{frame_size}%")) unless frame_size.nil? }
  scope :by_part_type, lambda { |part_type| join(:drawings, where('part_type LIKE ?', "%#{part_type}%")) unless part_type.nil? }
  scope :by_created_before, lambda { |created_before| where(created_before <= :created_on) unless created_before.nil? }
  scope :by_created_after, lambda { |created_after| where(created_after >= :created_on) unless created_after.nil? }
  
end
