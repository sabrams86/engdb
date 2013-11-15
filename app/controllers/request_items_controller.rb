class RequestItemsController < ApplicationController
  # GET /request_items
  # GET /request_items.json
  def index
    @request_items = RequestItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_items }
    end
  end

  # GET /request_items/1
  # GET /request_items/1.json
  def show
    @request_item = RequestItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_item }
    end
  end

  # GET /request_items/new
  # GET /request_items/new.json
  def new
    @request_item = RequestItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_item }
    end
  end

  # GET /request_items/1/edit
  def edit
    @request_item = RequestItem.find(params[:id])
  end

  # POST /request_items
  # POST /request_items.json
  def create
    @request_item = RequestItem.new(params[:request_item])

    respond_to do |format|
      if @request_item.save
        format.html { redirect_to @request_item, notice: 'Request item was successfully created.' }
        format.json { render json: @request_item, status: :created, location: @request_item }
      else
        format.html { render action: "new" }
        format.json { render json: @request_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_items/1
  # PUT /request_items/1.json
  def update
    @request_item = RequestItem.find(params[:id])

    respond_to do |format|
      if @request_item.update_attributes(params[:request_item])
        format.html { redirect_to @request_item, notice: 'Request item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_items/1
  # DELETE /request_items/1.json
  def destroy
    @request_item = RequestItem.find(params[:id])
    @request_item.destroy

    respond_to do |format|
      format.html { redirect_to request_items_url }
      format.json { head :no_content }
    end
  end
end
