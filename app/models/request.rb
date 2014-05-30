class Request < ActiveRecord::Base
  has_many :request_items, :dependent => :destroy
  accepts_nested_attributes_for :request_items, :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? }}, :allow_destroy => true
  belongs_to :user
  
  PRODUCT_LINES = [ "A9", "A7", "AG", "AF", "S3", "Legacy", "K/Kpro", "EMW", "HD", "Non-Metallic" ]
  
  validates :request_number, :description, :product_line, presence: true
  validates :request_number, uniqueness: true
  
  scope :by_request_number, lambda { |request_number| where('request_number LIKE ?', "%#{request_number}%") unless request_number.nil? }
  scope :by_product_line, lambda { |product_line| where('product_line LIKE ?', "#{product_line}%") unless product_line.nil? }
  scope :by_regional_sales_mgr, lambda { |regional_sales_mgr| where('regional_sales_mgr LIKE ?', "#{regional_sales_mgr}%") unless regional_sales_mgr.nil? }
  scope :by_quote_number, lambda { |quote_number| where('quote_number LIKE ?', "%#{quote_number}%") unless quote_number.nil? }
  scope :by_customer, lambda { |customer| where('customer LIKE ?', "%#{customer}%") unless customer.nil? }
  scope :by_created_before, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('inq_submitted_date <= ?', d) } 
    
  scope :by_created_after, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('inq_submitted_date >= ?', d) }

  
  def incrament(request)
    request[:request_number] = Request.maximum(:request_number) + 1
    return request
  end
  def complete_status(request)
    @request = request
    @request[:status] = "Complete"
    return request
  end  
  def eng_status(request)
    @request = request
    @request[:status] = "In Engineering"
    return request
  end  
  def mfg_status(request)
    @request = request
    @request[:status] = "In Manufacturing"
    return request
  end  
  def acct_status(request)
    @request = request
    @request[:status] = "In Accounting"
    return request
  end  
  def sor_status(request)
    @request = request
    @request[:status] = "SOR Released"
    return request
  end  
  def created_status(request)
    @request = request
    @request[:status] = "Created"
    return request
  end  

end

