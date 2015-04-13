class BulletinFilesController < ApplicationController
  # GET /bulletin_files
  # GET /bulletin_files.json
  def index
    @bulletin_files = BulletinFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bulletin_files }
    end
  end

  # GET /bulletin_files/1
  # GET /bulletin_files/1.json
  def show
    @bulletin_file = BulletinFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bulletin_file }
    end
  end

  # GET /bulletin_files/new
  # GET /bulletin_files/new.json
  def new
    @bulletin_file = BulletinFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bulletin_file }
    end
  end

  # GET /bulletin_files/1/edit
  def edit
    @bulletin_file = BulletinFile.find(params[:id])
  end

  # POST /bulletin_files
  # POST /bulletin_files.json
  def create
    @bulletin_file = BulletinFile.new(params[:bulletin_file])

    respond_to do |format|
      if @bulletin_file.save
        format.html { redirect_to @bulletin_file, notice: 'Bulletin file was successfully created.' }
        format.json { render json: @bulletin_file, status: :created, location: @bulletin_file }
      else
        format.html { render action: "new" }
        format.json { render json: @bulletin_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bulletin_files/1
  # PUT /bulletin_files/1.json
  def update
    @bulletin_file = BulletinFile.find(params[:id])

    respond_to do |format|
      if @bulletin_file.update_attributes(params[:bulletin_file])
        format.html { redirect_to @bulletin_file, notice: 'Bulletin file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bulletin_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulletin_files/1
  # DELETE /bulletin_files/1.json
  def destroy
    @bulletin_file = BulletinFile.find(params[:id])
    @bulletin_file.destroy

    respond_to do |format|
      format.html { redirect_to bulletin_files_url }
      format.json { head :no_content }
    end
  end
end
