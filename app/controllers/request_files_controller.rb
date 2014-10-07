class RequestFilesController < ApplicationController
  # GET /request_files
  # GET /request_files.json
  def index
    @request_files = RequestFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_files }
    end
  end

  # GET /request_files/1
  # GET /request_files/1.json
  def show
    @request_file = RequestFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_file }
    end
  end

  # GET /request_files/new
  # GET /request_files/new.json
  def new
    @request_file = RequestFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_file }
    end
  end

  # GET /request_files/1/edit
  def edit
    @request_file = RequestFile.find(params[:id])
  end

  # POST /request_files
  # POST /request_files.json
  def create
    @request_file = RequestFile.new(params[:request_file])

    respond_to do |format|
      if @request_file.save
        format.html { redirect_to @request_file, notice: 'Request file was successfully created.' }
        format.json { render json: @request_file, status: :created, location: @request_file }
      else
        format.html { render action: "new" }
        format.json { render json: @request_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_files/1
  # PUT /request_files/1.json
  def update
    @request_file = RequestFile.find(params[:id])

    respond_to do |format|
      if @request_file.update_attributes(params[:request_file])
        format.html { redirect_to @request_file, notice: 'Request file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_files/1
  # DELETE /request_files/1.json
  def destroy
    @request_file = RequestFile.find(params[:id])
    @request_file.destroy

    respond_to do |format|
      format.html { redirect_to request_files_url }
      format.json { head :no_content }
    end
  end
end
