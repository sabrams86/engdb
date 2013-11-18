module UsersHelper
  
def user_in_sales?
  user = User.find_by_id(session[:user_id])
  user.present? && (user[:department] == "Sales" or user[:department] == "Admin")
end

def user_in_engineering?
  user = User.find_by_id(session[:user_id])
  user.present? && (user[:department] == "Engineering" or user[:department] == "Admin")
end
  
def user_in_customer_service?
  user = User.find_by_id(session[:user_id])
  user.present? && (user[:department] == "Customer Service" or user[:department] == "Admin")
end
  
def user_in_manufacturing?
  user = User.find_by_id(session[:user_id])
  user.present? && (user[:department] == "Manufacturing" or user[:department] == "Admin")
end

def user_in_purchasing?
  user = User.find_by_id(session[:user_id])
  user.present? && (user[:department] == "Purchasing" or user[:department] == "Admin")
end

def user_in_accounting?
  user = User.find_by_id(session[:user_id])
  user.present? && (user[:department] == "Accounting" or user[:department] == "Admin")
end

def user_in_admin?
  user = User.find_by_id(session[:user_id])
  user.present? && user[:department] == "Admin"
end

end
