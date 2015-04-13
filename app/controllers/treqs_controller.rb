class TreqsController < ApplicationController
  handles_sortable_columns
  before_filter :eng_check, only: [:new, :create, :update, :show, :edit]
  before_filter :admin_check, only: [:destroy]
  # GET /treqs
  # GET /treqs.json
  def index
    order = sortable_column_order, "test_number desc"
    if params[:description].nil? or params[:pump_model].nil?
    @treqs = Treq.paginate page: params[:page], order: order, per_page: 50
    else
      @treqs = Treq\
      .by_keyword(params[:description])\
      .by_pump_model(params[:pump_model])\
      .paginate page: params[:page], order: order, per_page: 50
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @treqs }
    end
  end

  # GET /treqs/1
  # GET /treqs/1.json
  def show
    @treq = Treq.find(params[:id])
    @treq_files = @treq.treq_files.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treq }
    end
  end

  # GET /treqs/new
  # GET /treqs/new.json
  def new
    @treq = Treq.new
    @treq = @treq.incrament(@treq)
    @treq_file = @treq.treq_files.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @treq }
    end
  end

  # GET /treqs/1/edit
  def edit
    @treq = Treq.find(params[:id])
    @treq_files = @treq.treq_files.all
    if @treq_files.blank?
      @treq_file = @treq.treq_files.build
    else
    end
  end

  # POST /treqs
  # POST /treqs.json
  def create
    @treq = Treq.new(params[:treq])
    
    respond_to do |format|
      if @treq.save
        unless params[:treq_files].blank?
          params[:treq_files]['file'].each do |a|
            @treq_file = @treq.treq_files.create!(:file => a, :treq_id => @treq.id)
          end
        end
        TreqNotifier.submit_treq(@treq).deliver
        format.html { redirect_to @treq, notice: 'Treq was successfully created.' }
        format.json { render json: @treq, status: :created, location: @treq }
      else
        format.html { render action: "new", alert: "Test Requset has been submitted."}
        format.json { render json: @treq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /treqs/1
  # PUT /treqs/1.json
  def update
    @treq = Treq.find(params[:id])

    respond_to do |format|
      unless params[:treq_files].blank?
          params[:treq_files]['file'].each do |a|
            @treq_file = @treq.treq_files.create!(:file => a, :treq_id => @treq.id)
          end
        end
      if @treq.update_attributes(params[:treq])
        format.html { redirect_to @treq, notice: 'Treq was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @treq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treqs/1
  # DELETE /treqs/1.json
  def destroy
    @treq = Treq.find(params[:id])
    @treq.destroy

    respond_to do |format|
      format.html { redirect_to treqs_url }
      format.json { head :no_content }
    end
  end
  
  def download
    @treq_file = TreqFile.where('id LIKE ?', params[:id])
    @path = @treq_file.each do |p|
      return p.file_url
    end
    @name = params[:file]
    # for windows testing
    #@file = "c://users/sabrams/engdb/public#{@name}"
    # for linux live system
    @file = "/srv/engdb/public#{@name}"
    # for home mac system
    #@file = "/users/fonmus/documents/aptana\ studio\ 3\ workspace/engdb/public#{@name}"
    send_file( @file,
    :disposition => 'inline',
    :x_sendfile => true )
   
  #rescue TypeError
  #    redirect_to @request, :flash => { :alert => "File not found.  Please try again or contact support." }
  end 

  private
   def treq_params
      params.require(:treq).permit(:treq_number, treq_attributes: [:id, :treq_id, :file])
   end
  
end
