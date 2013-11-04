class EcnsController < ApplicationController
  handles_sortable_columns
  # GET /ecns
  # GET /ecns.json
  def index
      order = sortable_column_order, "ecn_number desc"
    if params[:ecns].nil?
       @ecns = Ecn.paginate page: params[:page], order: order, per_page: 25
    else
       @ecns = Ecn.by_ecn_number(params[:ecns][:ecn_number])\
         .by_drawing_number(params[:ecns][:drawing_number])\
         .paginate page: params[:page], order: order, per_page: 25

        #  .by_pump_model(params[:ecns][:pump_model])\
        #  .by_frame(params[:ecns][:frame_size])\
        #  .by_part_type(params[:ecns][:part_type])\
        #  .by_created_before(params[:ecns]['created_before(1i)'], params[:ecns]['created_before(2i)'], params[:ecns]['created_before(3i)'])\
        #  .by_created_after(params[:ecns]['created_after(1i)'], params[:ecns]['created_after(2i)'], params[:ecns]['created_after(3i)'])\
         
    end
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
    @ecn = @ecn.incrament(@ecn)
    
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
    @ecn.status = false

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
  
  def submit
      
    @ecn = Ecn.find(params[:id])
    @email_list = EmailList.all
    
    respond_to do |format|
      EcnNotifier.submit_engineering(@ecn).deliver if @ecn.distribute_engineering?
      EcnNotifier.submit_purchasing(@ecn).deliver if @ecn.distribute_purchasing?
      EcnNotifier.submit_manufacturing(@ecn).deliver if @ecn.distribute_manufacturing?
      EcnNotifier.submit_qantel(@ecn).deliver if @ecn.distribute_qantel?
      EcnNotifier.submit_planning(@ecn).deliver if @ecn.distribute_planning?
      format.html { redirect_to ecns_url, alert: "Ecn has been submitted for approval." }
      format.json { render json: @ecns }
    end
  end
  
  def close
    @ecn = Ecn.find(params[:id])
    @ecn = @ecn.close_status(@ecn)
    
    respond_to do |format|
      EcnNotifier.close_engineering(@ecn).deliver if @ecn.distribute_engineering?
      format.html { redirect_to ecns_url, alert: "Ecn has been closed.  A confirmation email has been sent to the appropriate personnel." }
      format.json { render json: @ecns }
    end
  end
end
