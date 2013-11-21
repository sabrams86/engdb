module DrawingsHelper
  
  def catch_drawing_not_found
 #   yield
  rescue ActiveRecord::RecordNotFound
    redirect_to drawing, :flash => { :error => "Drawing not found.  Please check shop prints manually." }
  end
  
end
