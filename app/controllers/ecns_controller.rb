class EcnsController < ApplicationController
  # GET /ecns
  # GET /ecns.json
  def index
    @ecns = Ecn.by_user_name(params[:ecns][:user_name]).by_drawing_number(params[:ecns][:drawing_number]).by_pump_model\
    (params[:ecns][:pump_model]).by_frame_size(params[:ecns][:frame_size]).by_part_type(params[:ecns][:part_type]).\
    by_created_before(params[:ecns][:created_on]).by_created_after(params[:ecns][:created_on]).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ecns }
    end
  end

  # GET /ecns/1
  # GET /ecns/1.json
  def show
    @ecn = Ecn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ecn }
    end
  end

  # GET /ecns/new
  # GET /ecns/new.json
  def new
    @ecn = Ecn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ecn }
    end
  end

  # GET /ecns/1/edit
  def edit
    @ecn = Ecn.find(params[:id])
  end

  # POST /ecns
  # POST /ecns.json
  def create
    @ecn = Ecn.new(params[:ecn])

    respond_to do |format|
      if @ecn.save
        format.html { redirect_to @ecn, notice: 'Ecn was successfully created.' }
        format.json { render json: @ecn, status: :created, location: @ecn }
      else
        format.html { render action: "new" }
        format.json { render json: @ecn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ecns/1
  # PUT /ecns/1.json
  def update
    @ecn = Ecn.find(params[:id])

    respond_to do |format|
      if @ecn.update_attributes(params[:ecn])
        format.html { redirect_to @ecn, notice: 'Ecn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ecn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ecns/1
  # DELETE /ecns/1.json
  def destroy
    @ecn = Ecn.find(params[:id])
    @ecn.destroy

    respond_to do |format|
      format.html { redirect_to ecns_url }
      format.json { head :no_content }
    end
  end
  
#  def submit
#    @ecn = Ecn.find(params[:ecn])
#
#    respond_to do |format|
#      if @ecn.save
#        format.html { redirect_to @ecn, notice: 'Ecn has been submitted for approval.' }
#        format.json { render json: @ecn, status: :created, location: @ecn }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @ecn.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#  
#  def close
#    @ecn = Ecn.find(params[:ecn])
#
#    respond_to do |format|
#      if @ecn.save
#        format.html { redirect_to @ecn, notice: 'Ecn has been closed, all applicable departments have been notified.' }
#        format.json { render json: @ecn, status: :created, location: @ecn }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @ecn.errors, status: :unprocessable_entity }
#      end
#    end
#  end
end
