module ApplicationHelper
  def link_to_remove_fields(name, f, options = {})
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", options)
  end

  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{ association }") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
 
    link_to_function(name, "add_fields(this, '#{ association }', '#{ escape_javascript(fields) }')", options)
  end
  def user_name
    user = User.find_by_id(session[:user_id])
    return user.name
  end
  def user_in_sales?
    user = User.find_by_id(session[:user_id])
    user.present? && (user[:department] == "Sales" or user[:department] == "Admin")
  end
  
  def user_in_quality?
    user = User.find_by_id(session[:user_id])
    user.present? && (user[:department] == "Quality" or user[:department] == "Admin")
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
  
  def user_in_shop?
      user=User.find_by_id(session[:user_id])
      user.present? && user[:department] == "shop"
  end
  
  def user_is_logged_in?
    session[:user_id]
  end
  
end
