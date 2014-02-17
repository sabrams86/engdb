class TreqsController < ApplicationController
  handles_sortable_columns
  before_filter :eng_check, only: [:new, :create, :update, :show, :edit]
  before_filter :admin_check, only: [:destroy]
  # GET /treqs
  # GET /treqs.json
  def index
    order = sortable_column_order, "test_number desc"
    @treqs = Treq.paginate page: params[:page], order: order, per_page: 50

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @treqs }
    end
  end

  # GET /treqs/1
  # GET /treqs/1.json
  def show
    @treq = Treq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treq }
    end
  end

  # GET /treqs/new
  # GET /treqs/new.json
  def new
    @treq = Treq.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @treq }
    end
  end

  # GET /treqs/1/edit
  def edit
    @treq = Treq.find(params[:id])
  end

  # POST /treqs
  # POST /treqs.json
  def create
    @treq = Treq.new(params[:treq])
    TreqNotifier.submit_treq(@treq).deliver
    respond_to do |format|
      if @treq.save
        
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
end
