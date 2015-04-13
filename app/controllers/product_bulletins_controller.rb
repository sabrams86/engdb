class ProductBulletinsController < ApplicationController
  handles_sortable_columns
  before_filter :eng_check, only: [:new, :create, :update, :edit]
  before_filter :admin_check, only: [:destroy]
  # GET /product_bulletins
  # GET /product_bulletins.json
  def index
    order = sortable_column_order, "number desc"
    if params[:subject].nil? or params[:model].nil?
      @product_bulletins = ProductBulletin.paginate page: params[:page], order: order, per_page: 50
    else
      @product_bulletins = ProductBulletin\
      .by_keyword(params[:subject])\
      .by_model(params[:model])\
      .paginate page: params[:page], order: order, per_page: 50
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_bulletins }
    end
  end

  # GET /product_bulletins/1
  # GET /product_bulletins/1.json
  def show
    @product_bulletin = ProductBulletin.find(params[:id])
    @bulletin_files = @product_bulletin.bulletin_files.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_bulletin }
    end
  end

  # GET /product_bulletins/new
  # GET /product_bulletins/new.json
  def new
    @product_bulletin = ProductBulletin.new
    @product_bulletin = @product_bulletin.incrament(@product_bulletin)
    @bulletin_file = @product_bulletin.bulletin_files.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_bulletin }
    end
  end

  # GET /product_bulletins/1/edit
  def edit
    @product_bulletin = ProductBulletin.find(params[:id])
    @bulletin_files = @product_bulletin.bulletin_files.all
    if @bulletin_files.blank?
      @bulletin_file = @product_bulletin.bulletin_files.build
    else
    end
  end

  # POST /product_bulletins
  # POST /product_bulletins.json
  def create
    @product_bulletin = ProductBulletin.new(params[:product_bulletin])

    respond_to do |format|
      if @product_bulletin.save
        unless params[:bulletin_files].blank?
          params[:bulletin_files]['file'].each do |a|
            @bulletin_file = @product_bulletin.bulletin_files.create!(:file => a, :product_bulletin_id => @product_bulletin.id)
          end
        end
        format.html { redirect_to @product_bulletin, notice: 'Product bulletin was successfully created.' }
        format.json { render json: @product_bulletin, status: :created, location: @product_bulletin }
      else
        format.html { render action: "new" }
        format.json { render json: @product_bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_bulletins/1
  # PUT /product_bulletins/1.json
  def update
    @product_bulletin = ProductBulletin.find(params[:id])

    respond_to do |format|
      unless params[:bulletin_files].blank?
          params[:bulletin_files]['file'].each do |a|
            @bulletin_file = @product_bulletin.bulletin_files.create!(:file => a, :product_bulletin_id => @product_bulletin.id)
          end
      end
      if @product_bulletin.update_attributes(params[:product_bulletin])
        format.html { redirect_to @product_bulletin, notice: 'Product bulletin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_bulletins/1
  # DELETE /product_bulletins/1.json
  def destroy
    @product_bulletin = ProductBulletin.find(params[:id])
    @product_bulletin.destroy

    respond_to do |format|
      format.html { redirect_to product_bulletins_url }
      format.json { head :no_content }
    end
  end

  def download
    @bulletin_file = BulletinFile.where('id LIKE ?', params[:id])
    @path = @bulletin_file.each do |p|
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
   def product_bulletin_params
      params.require(:product_bulletin).permit(:product_bulletin_number, bulletin_files_attributes: [:id, :product_bulletin_id, :file])
   end
   
end
