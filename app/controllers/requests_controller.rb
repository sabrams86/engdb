class RequestsController < ApplicationController
  handles_sortable_columns
  before_filter :sales_check, only: [:create, :new]
  before_filter :admin_check, only: [:destroy]
  # GET /requests
  # GET /requests.json
  def index
    order = sortable_column_order, "request_number desc"
   if params[:requests].nil?
       @requests = Request.paginate page: params[:page], order: order, per_page: 100
    else
      @requests = Request\
      .by_request_number(params[:requests][:request_number])\
      .by_regional_sales_mgr(params[:requests][:regional_sales_mgr])\
      .by_product_line(params[:requests][:product_line])\
      .by_quote_number(params[:requests][:quote_number])\
      .by_customer(params[:requests][:customer])\
      .by_created_before(params[:requests]['created_before(1i)'], params[:requests]['created_before(2i)'], params[:requests]['created_before(3i)'])\
      .by_created_after(params[:requests]['created_after(1i)'], params[:requests]['created_after(2i)'], params[:requests]['created_after(3i)'])\
      .paginate page: params[:page], order: order, per_page: 100
      
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end
  
  def index_open
    order = sortable_column_order, "request_number desc"
    @requests = Request.by_open_requests.paginate page: params[:page], order: order, per_page: 100
    
    respond_to do |format|
      format.html { render :template => "requests/index" }
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
    @request = @request.incrament(@request)

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
    @request = @request.created_status(@request)

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
    @email = params[:email]
    @message = @email[:message]
    @request = @request.eng_status(@request)
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    
    respond_to do |format|
      RequestMailer.submit_additional(@request, @message, @additional_emails, @subject).deliver if @additional_emails != ""
      RequestMailer.notify_a9(@request, @message, @subject).deliver if @request.product_line == "A9"
      RequestMailer.notify_a7(@request, @message, @subject).deliver if @request.product_line == "A7"
      RequestMailer.notify_ag(@request, @message, @subject).deliver if @request.product_line == "AG"
      RequestMailer.notify_af(@request, @message, @subject).deliver if @request.product_line == "AF"
      RequestMailer.notify_S3(@request, @message, @subject).deliver if @request.product_line == "S3"
      RequestMailer.notify_legacy(@request, @message, @subject).deliver if @request.product_line == "Legacy"
      RequestMailer.notify_kkpro(@request, @message, @subject).deliver if @request.product_line == "K/Kpro"
      RequestMailer.notify_emw(@request, @message, @subject).deliver if @request.product_line == "EMW"
      RequestMailer.notify_hd(@request, @message, @subject).deliver if @request.product_line == "HD"
      RequestMailer.notify_nm(@request, @message, @subject).deliver if @request.product_line == "Non-Metallic"
      
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SIR has been submitted to engineering.  Please push up the revision level and resubmit if you make any changes." }
      format.json { render json: @requests }
    end
  end
  
  def submit_mfg
      
    @request = Request.find(params[:id])
    @email = params[:email]
    @message = @email[:message]
    @request = @request.mfg_status(@request)
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    
    respond_to do |format|
      RequestMailer.submit_additional(@request, @message, @additional_emails, @subject).deliver if @additional_emails != ""
      RequestMailer.notify_mfg(@request, @message, @subject).deliver 
      
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SIR has been submitted to manufacturing.  Please resubmit if you make any changes." }
      format.json { render json: @requests }
    end
  end
  
  def reject
      
    @request = Request.find(params[:id])
    @email = params[:email]
    @message = @email[:message]
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    
    respond_to do |format|
      RequestMailer.reject_additional(@request, @message, @additional_emails, @subject).deliver if @additional_emails != ""
      RequestMailer.reject(@request, @message, @subject).deliver 
      
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SIR has been returned to sales marked as incomplete." }
      format.json { render json: @requests }
    end
  end
  
  def submit_acct
      
    @request = Request.find(params[:id])
    @email = params[:email]
    @message = @email[:message]
    @request = @request.acct_status(@request)
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    
    respond_to do |format|
      RequestMailer.submit_additional(@request, @message, @additional_emails, @subject).deliver if @additional_emails != ""
      RequestMailer.notify_acct(@request, @message, @subject).deliver 
      
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SIR has been submitted to accounting.  Please resubmit if you make any changes." }
      format.json { render json: @requests }
    end
  end
  
  def submit_sales
      
    @request = Request.find(params[:id])
    @email = params[:email]
    @message = @email[:message]
    @request = @request.complete_status(@request)
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    
    respond_to do |format|
      RequestMailer.submit_additional(@request, @message, @additional_emails, @subject).deliver if @additional_emails != ""
      RequestMailer.notify_sales(@request, @message, @subject).deliver 
      
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SIR has been submitted to Sales.  Please resubmit if you make any changes." }
      format.json { render json: @requests }
    end
  end
  
  def submit_sor
    @request = Request.find(params[:id])
    @email = params[:email]
    @message = @email[:message]
    @request = @request.sor_status(@request)
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    
    respond_to do |format|
      RequestMailer.submit_additional(@request, @message, @additional_emails, @subject).deliver if @additional_emails != ""
      RequestMailer.notify_a9(@request, @message, @subject).deliver if @request.product_line == "A9"
      RequestMailer.notify_a7(@request, @message, @subject).deliver if @request.product_line == "A7"
      RequestMailer.notify_ag(@request, @message, @subject).deliver if @request.product_line == "AG"
      RequestMailer.notify_af(@request, @message, @subject).deliver if @request.product_line == "AF"
      RequestMailer.notify_S3(@request, @message, @subject).deliver if @request.product_line == "S3"
      RequestMailer.notify_legacy(@request, @message, @subject).deliver if @request.product_line == "Legacy"
      RequestMailer.notify_kkpro(@request, @message, @subject).deliver if @request.product_line == "K/Kpro"
      RequestMailer.notify_emw(@request, @message, @subject).deliver if @request.product_line == "EMW"
      RequestMailer.notify_hd(@request, @message, @subject).deliver if @request.product_line == "HD"
      RequestMailer.notify_nm(@request, @message, @subject).deliver if @request.product_line == "Non-Metallic"
      RequestMailer.notify_mfg(@request, @message, @subject).deliver 
    
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SOR has been created.  An email has been sent to the appropriate personnel." }
      format.json { render json: @requests }
    end
  end
  
  def close_sir
    @request = Request.find(params[:id])
    @request = @request.complete_status(@request)
    
    respond_to do |format|
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SIR has been marked as complete." }
      format.json { render json: @requests }
    end
  end
  
end
