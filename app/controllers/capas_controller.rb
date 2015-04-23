class CapasController < ApplicationController
  handles_sortable_columns
  before_filter :admin_check, only: [:destroy]
  # GET /capas
  # GET /capas.json
  def index
    order = sortable_column_order, "capa_number desc"
    @capas = Capa.all
    @capas = Capa.paginate page: params[:page], order: order, per_page: 50

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @capas }
    end
  end

  # GET /capas/1
  # GET /capas/1.json
  def show
    @capa = Capa.find(params[:id])
    @capa_files = @capa.capa_files.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @capa }
    end
  end

  # GET /capas/new
  # GET /capas/new.json
  def new
    @capa = Capa.new
    @capa = @capa.incrament(@capa)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capa }
    end
  end

  # GET /capas/1/edit
  def edit
    @capa = Capa.find(params[:id])
  end

  # POST /capas
  # POST /capas.json
  def create
    @capa = Capa.new(params[:capa])

    respond_to do |format|
      if @capa.save
        
        CapaMailer.submit_capa(@capa).deliver
        format.html { redirect_to new_capa_path, notice: 'Capa was successfully notice.' }
        format.json { render json: @capa, status: :created, location: @capa }
      else
        format.html { render action: "new" }
        format.json { render json: @capa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capas/1
  # PUT /capas/1.json
  def update
    @capa = Capa.find(params[:id])

    respond_to do |format|
      if @capa.update_attributes(params[:capa])
        format.html { redirect_to @capa, notice: 'Capa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @capa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capas/1
  # DELETE /capas/1.json
  def destroy
    @capa = Capa.find(params[:id])
    @capa.destroy

    respond_to do |format|
      format.html { redirect_to capas_url }
      format.json { head :no_content }
    end
  end
  
  def assign
      
    @capa = Capa.find(params[:id])
    @email = params[:email]
    @message = @email[:message]
    @capa = @capa.assign_status(@capa)
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    attachment = params[:attachment]
    
    respond_to do |format|
      CapaMailer.submit_additional(@capa, @message, @additional_emails, @subject, attachment).deliver if @additional_emails != ""
      CapaMailer.assign_capa(@capa, @message, @subject, attachment).deliver 
      
      @capa.update_attributes(params[:capa])
      format.html { redirect_to capas_url, alert: "CAPA has been assigned." }
      format.json { render json: @capas }
    end
  end
  
  def resolve
      
    @capa = Capa.find(params[:id])
    @email = params[:email]
    @message = @email[:message]
    @capa = @capa.assign_status(@capa)
    @subject = @email[:subject]
    @additional_emails = @email[:recipient]
    attachment = params[:attachment]
    
    respond_to do |format|
      CapaMailer.submit_additional(@capa, @message, @additional_emails, @subject, attachment).deliver if @additional_emails != ""
      CapaMailer.resolve_capa(@capa, @message, @subject, attachment).deliver 
      
      @capa.update_attributes(params[:capa])
      format.html { redirect_to capas_url, alert: "CAPA has been assigned." }
      format.json { render json: @capas }
    end
  end
  
  def close
    @capa = Capa.find(params[:id])
    @capa = @capa.complete_status(@capa)
    
    respond_to do |format|
      @request.update_attributes(params[:request])
      format.html { redirect_to home_url, alert: "SIR has been marked as complete." }
      format.json { render json: @requests }
    end
  end
  
  def download
    @capa_file = CapaFile.where('id LIKE ?', params[:id])
    @path = @capa_file.each do |p|
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
  
end
