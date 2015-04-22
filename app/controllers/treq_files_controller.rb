class TreqFilesController < ApplicationController
  # GET /treq_files
  # GET /treq_files.json
  def index
    @treq_files = TreqFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @treq_files }
    end
  end

  # GET /treq_files/1
  # GET /treq_files/1.json
  def show
    @treq_file = TreqFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treq_file }
    end
  end

  # GET /treq_files/new
  # GET /treq_files/new.json
  def new
    @treq_file = TreqFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @treq_file }
    end
  end

  # GET /treq_files/1/edit
  def edit
    @treq_file = TreqFile.find(params[:id])
  end

  # POST /treq_files
  # POST /treq_files.json
  def create
    @treq_file = TreqFile.new(params[:treq_file])

    respond_to do |format|
      if @treq_file.save
        
        format.html { redirect_to @treq_file, notice: 'Treq file was successfully created.' }
        format.json { render json: @treq_file, status: :created, location: @treq_file }
      else
        format.html { render action: "new" }
        format.json { render json: @treq_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /treq_files/1
  # PUT /treq_files/1.json
  def update
    @treq_file = TreqFile.find(params[:id])

    respond_to do |format|
      if @treq_file.update_attributes(params[:treq_file])
        format.html { redirect_to @treq_file, notice: 'Treq file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @treq_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treq_files/1
  # DELETE /treq_files/1.json
  def destroy
    @treq_file = TreqFile.find(params[:id])
    @treq_file.destroy

    respond_to do |format|
      format.html { redirect_to treq_files_url }
      format.json { head :no_content }
    end
  end
end
