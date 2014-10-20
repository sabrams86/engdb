class RequestItem < ActiveRecord::Base
  belongs_to :request
  RELATIVE_SIZE = [ "-50%", "-45%", "-40%", "-35%", "-30%", "-25%", "-20%", "-15%", "-10%", "-5%", "Same Size", 
    "+5%", "+10%", "+15%", "+20%", "+25%", "+30%", "+35%", "+40%", "+45%", "+50%" ]
  DESIGN_TYPE = ["New Design", "Modified Existing Design", "New Option on Current Design", "N/A"]
  SUBSTITUTION_TYPE = ["Add to Pump BOM", "Swap For Other Part (see comments)", "Price Individually"]
  BILLING = ["Fully Billable", "Partially Billable", "Not Billable (see comments)"]
end
