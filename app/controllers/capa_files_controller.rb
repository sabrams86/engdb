class CapaFilesController < ApplicationController
  # GET /capa_files
  # GET /capa_files.json
  def index
    @capa_files = CapaFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @capa_files }
    end
  end

  # GET /capa_files/1
  # GET /capa_files/1.json
  def show
    @capa_file = CapaFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @capa_file }
    end
  end

  # GET /capa_files/new
  # GET /capa_files/new.json
  def new
    @capa_file = CapaFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capa_file }
    end
  end

  # GET /capa_files/1/edit
  def edit
    @capa_file = CapaFile.find(params[:id])
  end

  # POST /capa_files
  # POST /capa_files.json
  def create
    @capa_file = CapaFile.new(params[:capa_file])

    respond_to do |format|
      if @capa_file.save
        format.html { redirect_to @capa_file, notice: 'Capa file was successfully created.' }
        format.json { render json: @capa_file, status: :created, location: @capa_file }
      else
        format.html { render action: "new" }
        format.json { render json: @capa_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capa_files/1
  # PUT /capa_files/1.json
  def update
    @capa_file = CapaFile.find(params[:id])

    respond_to do |format|
      if @capa_file.update_attributes(params[:capa_file])
        format.html { redirect_to @capa_file, notice: 'Capa file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @capa_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capa_files/1
  # DELETE /capa_files/1.json
  def destroy
    @capa_file = CapaFile.find(params[:id])
    @capa_file.destroy

    respond_to do |format|
      format.html { redirect_to capa_files_url }
      format.json { head :no_content }
    end
  end
end
