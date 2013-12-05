class EngineeringProjectsController < ApplicationController
    handles_sortable_columns
    before_filter :eng_check
  
  # GET /engineering_projects
  # GET /engineering_projects.json
  def index
    order = sortable_column_order, "project_number desc"
    @engineering_projects = EngineeringProject.paginate page: params[:page], order: order, per_page: 25

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @engineering_projects }
    end
  end

  # GET /engineering_projects/1
  # GET /engineering_projects/1.json
  def show
    @engineering_project = EngineeringProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @engineering_project }
    end
  end

  # GET /engineering_projects/new
  # GET /engineering_projects/new.json
  def new
    @engineering_project = EngineeringProject.new
    @engineering_project = @engineering_project.incrament(@engineering_project)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @engineering_project }
    end
  end

  # GET /engineering_projects/1/edit
  def edit
    @engineering_project = EngineeringProject.find(params[:id])
  end

  # POST /engineering_projects
  # POST /engineering_projects.json
  def create
    @engineering_project = EngineeringProject.new(params[:engineering_project])

    respond_to do |format|
      if @engineering_project.save
        format.html { redirect_to engineering_projects_url, notice: 'Engineering project was successfully created.' }
        format.json { render json: @engineering_project, status: :created, location: @engineering_project }
      else
        format.html { render action: "new" }
        format.json { render json: @engineering_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /engineering_projects/1
  # PUT /engineering_projects/1.json
  def update
    @engineering_project = EngineeringProject.find(params[:id])

    respond_to do |format|
      if @engineering_project.update_attributes(params[:engineering_project])
        format.html { redirect_to @engineering_project, notice: 'Engineering project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @engineering_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engineering_projects/1
  # DELETE /engineering_projects/1.json
  def destroy
    @engineering_project = EngineeringProject.find(params[:id])
    @engineering_project.destroy

    respond_to do |format|
      format.html { redirect_to engineering_projects_url }
      format.json { head :no_content }
    end
  end
end
