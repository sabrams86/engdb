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
        format.html { redirect_to @capa, notice: 'Capa was successfully created.' }
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
end
