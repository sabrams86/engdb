class GagesController < ApplicationController
  handles_sortable_columns
  before_filter :eng_check
  before_filter :admin_check, only: [:destroy]
  # GET /gages
  # GET /gages.json
  def index
    order = sortable_column_order, "gage_number desc"
    @gages = Gage.paginate page: params[:page], order: order, per_page: 50
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gages }
    end
  end

  # GET /gages/1
  # GET /gages/1.json
  def show
    @gage = Gage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gage }
    end
  end

  # GET /gages/new
  # GET /gages/new.json
  def new
    @gage = Gage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gage }
    end
  end

  # GET /gages/1/edit
  def edit
    @gage = Gage.find(params[:id])
  end

  # POST /gages
  # POST /gages.json
  def create
    @gage = Gage.new(params[:gage])

    respond_to do |format|
      if @gage.save
        format.html { redirect_to @gage, notice: 'Gage was successfully created.' }
        format.json { render json: @gage, status: :created, location: @gage }
      else
        format.html { render action: "new" }
        format.json { render json: @gage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gages/1
  # PUT /gages/1.json
  def update
    @gage = Gage.find(params[:id])

    respond_to do |format|
      if @gage.update_attributes(params[:gage])
        format.html { redirect_to @gage, notice: 'Gage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gages/1
  # DELETE /gages/1.json
  def destroy
    @gage = Gage.find(params[:id])
    @gage.destroy

    respond_to do |format|
      format.html { redirect_to gages_url }
      format.json { head :no_content }
    end
  end
end
