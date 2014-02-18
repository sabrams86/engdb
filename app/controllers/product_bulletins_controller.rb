class ProductBulletinsController < ApplicationController
  handles_sortable_columns
  before_filter :eng_check, only: [:new, :create, :update, :edit]
  before_filter :admin_check, only: [:destroy]
  # GET /product_bulletins
  # GET /product_bulletins.json
  def index
    order = sortable_column_order, "number desc"
    @product_bulletins = ProductBulletin.paginate page: params[:page], order: order, per_page: 50

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_bulletins }
    end
  end

  # GET /product_bulletins/1
  # GET /product_bulletins/1.json
  def show
    @product_bulletin = ProductBulletin.find(params[:id])

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_bulletin }
    end
  end

  # GET /product_bulletins/1/edit
  def edit
    @product_bulletin = ProductBulletin.find(params[:id])
  end

  # POST /product_bulletins
  # POST /product_bulletins.json
  def create
    @product_bulletin = ProductBulletin.new(params[:product_bulletin])

    respond_to do |format|
      if @product_bulletin.save
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
end
