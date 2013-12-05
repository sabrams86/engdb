class EngineeringProceduresController < ApplicationController
  handles_sortable_columns
  before_filter :eng_check
  
  # GET /engineering_procedures
  # GET /engineering_procedures.json
  def index
    order = sortable_column_order, "procedure_number desc"
    @engineering_procedures = EngineeringProcedure.paginate page: params[:page], order: order, per_page: 25

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @engineering_procedures }
    end
  end

  # GET /engineering_procedures/1
  # GET /engineering_procedures/1.json
  def show
    @engineering_procedure = EngineeringProcedure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @engineering_procedure }
    end
  end

  # GET /engineering_procedures/new
  # GET /engineering_procedures/new.json
  def new
    @engineering_procedure = EngineeringProcedure.new
    @engineering_procedure = @engineering_procedure.incrament(@engineering_procedure)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @engineering_procedure }
    end
  end

  # GET /engineering_procedures/1/edit
  def edit
    @engineering_procedure = EngineeringProcedure.find(params[:id])
  end

  # POST /engineering_procedures
  # POST /engineering_procedures.json
  def create
    @engineering_procedure = EngineeringProcedure.new(params[:engineering_procedure])

    respond_to do |format|
      if @engineering_procedure.save
        format.html { redirect_to engineering_procedures_url, notice: 'Engineering procedure was successfully created.' }
        format.json { render json: @engineering_procedure, status: :created, location: @engineering_procedure }
      else
        format.html { render action: "new" }
        format.json { render json: @engineering_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /engineering_procedures/1
  # PUT /engineering_procedures/1.json
  def update
    @engineering_procedure = EngineeringProcedure.find(params[:id])

    respond_to do |format|
      if @engineering_procedure.update_attributes(params[:engineering_procedure])
        format.html { redirect_to @engineering_procedure, notice: 'Engineering procedure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @engineering_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engineering_procedures/1
  # DELETE /engineering_procedures/1.json
  def destroy
    @engineering_procedure = EngineeringProcedure.find(params[:id])
    @engineering_procedure.destroy

    respond_to do |format|
      format.html { redirect_to engineering_procedures_url }
      format.json { head :no_content }
    end
  end
end
