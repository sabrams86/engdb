class RequestsController < ApplicationController
  handles_sortable_columns
  before_filter :sales_check, only: [:create, :new]
  before_filter :admin_check, only: [:destroy]
  # GET /requests
  # GET /requests.json
  def index
    order = sortable_column_order, "request_number desc"
    @requests = Request.paginate page: params[:page], order: order, per_page: 100
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new
#    @request = @request.incrament(@request)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end
  
  def submit_eng
      
    @request = Request.find(params[:id])
    
    
    respond_to do |format|
      RequestNotifier.submit_engineering(@request).deliver if @ecn.distribute_engineering?

      format.html { redirect_to ecns_url, alert: "Ecn has been submitted for approval." }
      format.json { render json: @ecns }
    end
  end
  
  def create_sor
    @ecn = Ecn.find(params[:id])
    @ecn = @ecn.close_status(@ecn)
    
    respond_to do |format|
      EcnNotifier.close_engineering(@ecn).deliver if @ecn.distribute_engineering?
      EcnNotifier.close_purchasing(@ecn).deliver if @ecn.distribute_purchasing?
      EcnNotifier.close_manufacturing(@ecn).deliver if @ecn.distribute_manufacturing?
      EcnNotifier.close_qantel(@ecn).deliver if @ecn.distribute_qantel?
      EcnNotifier.close_planning(@ecn).deliver if @ecn.distribute_planning?
      EcnNotifier.close_sales(@ecn).deliver if @ecn.distribute_sales?
      EcnNotifier.close_inventory(@ecn).deliver if @ecn.distribute_inventory?
      EcnNotifier.close_quality(@ecn).deliver if @ecn.distribute_quality?
      EcnNotifier.close_india(@ecn).deliver if @ecn.distribute_india?
      EcnNotifier.close_finance(@ecn).deliver if @ecn.distribute_finance?
      format.html { redirect_to ecns_url, alert: "Ecn has been closed.  A confirmation email has been sent to the appropriate personnel." }
      format.json { render json: @ecns }
    end
  end
  
end
