class DrawingsController < ApplicationController
  handles_sortable_columns
  before_filter :eng_check, only: [:new, :create, :update]
  before_filter :admin_check, only: [:destroy]
#  before_filter :catch_drawing_not_found, only: [:view]
  # GET /drawings
  # GET /drawings.json
  def index
      order = sortable_column_order, "drawing_number desc"
    if params[:drawings].nil?
       @drawings = Drawing.paginate page: params[:page], order: order, per_page: 100
    else
      @drawings = Drawing\
      .by_description(params[:drawings][:description])\
      .by_drawing_number(params[:drawings][:drawing_number])\
      .by_item_number(params[:drawings][:item_number]).by_pump_model(params[:drawings][:pump_model])\
      .by_frame_size(params[:drawings][:frame_size])\
      .by_part_type(params[:drawings][:part_type])\
      .by_created_before(params[:drawings]['created_before(1i)'], params[:drawings]['created_before(2i)'], params[:drawings]['created_before(3i)'])\
      .by_created_after(params[:drawings]['created_after(1i)'], params[:drawings]['created_after(2i)'], params[:drawings]['created_after(3i)'])\
      .paginate page: params[:page], order: order, per_page: 100
      
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drawings }
    end
  end

  # GET /drawings/1
  # GET /drawings/1.json
  def show
    @drawing = Drawing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drawing }
    end
  end

  # GET /drawings/new
  # GET /drawings/new.json
  def new
    @drawing = Drawing.new
    @drawing = @drawing.incrament(@drawing)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drawing }
    end
  end

  # GET /drawings/1/edit
  def edit
    @drawing = Drawing.find(params[:id])
  end

  # POST /drawings
  # POST /drawings.json
  def create
    @drawing = Drawing.new(params[:drawing])

    respond_to do |format|
      if @drawing.save
        format.html { redirect_to @drawing, notice: 'Drawing was successfully created.' }
        format.json { render json: @drawing, status: :created, location: @drawing }
      else
        format.html { render action: "new" }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drawings/1
  # PUT /drawings/1.json
  def update
    @drawing = Drawing.find(params[:id])

    respond_to do |format|
      if @drawing.update_attributes(params[:drawing])
        format.html { redirect_to @drawing, notice: 'Drawing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drawings/1
  # DELETE /drawings/1.json
  def destroy
    @drawing = Drawing.find(params[:id])
    @drawing.destroy

    respond_to do |format|
      format.html { redirect_to drawings_url }
      format.json { head :no_content }
    end
  end
  
  def view
    @drawing = Drawing.find(params[:id])
    @path = @drawing.draw_path(@drawing)
    
    send_file( @path,
    :disposition => 'inline',
    :x_sendfile => true )
   
  rescue TypeError
      redirect_to @drawing, :flash => { :alert => "Drawing not found.  Please check shop prints manually." }
  end 

end
