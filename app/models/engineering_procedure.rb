class EngineeringProcedure < ActiveRecord::Base
  
  def incrament(engineering_procedure)
    @new_procedure_number = EngineeringProcedure.maximum(:procedure_number).last(3).to_i + 1 
    @new_procedure_number = "%03d" % @new_procedure_number
    @new_procedure_number = "EP-"+ @new_procedure_number.to_s
    engineering_procedure[:procedure_number] = @new_procedure_number
    return engineering_procedure
  end
  
end
