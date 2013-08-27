class DrawingsController < ApplicationController
  # GET /drawings
  # GET /drawings.json
  def index
    @drawings = Drawing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drawings }
    end
  end

  # GET /drawings/1
  # GET /drawings/1.json
  def show
    @drawing = Drawing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drawing }
    end
  end

  # GET /drawings/new
  # GET /drawings/new.json
  def new
    @drawing = Drawing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drawing }
    end
  end

  # GET /drawings/1/edit
  def edit
    @drawing = Drawing.find(params[:id])
  end

  # POST /drawings
  # POST /drawings.json
  def create
    @drawing = Drawing.new(params[:drawing])

    respond_to do |format|
      if @drawing.save
        format.html { redirect_to @drawing, notice: 'Drawing was successfully created.' }
        format.json { render json: @drawing, status: :created, location: @drawing }
      else
        format.html { render action: "new" }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drawings/1
  # PUT /drawings/1.json
  def update
    @drawing = Drawing.find(params[:id])

    respond_to do |format|
      if @drawing.update_attributes(params[:drawing])
        format.html { redirect_to @drawing, notice: 'Drawing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drawings/1
  # DELETE /drawings/1.json
  def destroy
    @drawing = Drawing.find(params[:id])
    @drawing.destroy

    respond_to do |format|
      format.html { redirect_to drawings_url }
      format.json { head :no_content }
    end
  end
end
