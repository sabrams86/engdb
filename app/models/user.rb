class User < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    has_secure_password
    has_many :ecns

  def forem_name
    name
  end
  def forem_email
    email
  end
end
