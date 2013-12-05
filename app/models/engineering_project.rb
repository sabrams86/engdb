class EngineeringProject < ActiveRecord::Base
  
  def incrament(engineering_project)
    engineering_project[:project_number] = EngineeringProject.maximum(:project_number) + 1
    return engineering_project
  end
  
end
