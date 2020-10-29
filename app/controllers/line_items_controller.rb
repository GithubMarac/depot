class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy, :destroy]
  skip_before_action :authorize, only: :create


  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  def decrement

  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    session[:counter] = 0

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_index_url }
        format.js { @current_item = @line_item }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|

      if @line_item.update

        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    puts "string"
    line_item = LineItem.find(params[:id])
    product = Product.find(line_item[:product_id])







    @line_item = @cart.remove_product(product)

    if @line_item.quantity == 0
      @line_item.delete
    else
      @line_item.save
    end




      respond_to do |format|
        if @cart.save
          format.html { redirect_to store_index_url }
          format.js { @current_item = @line_item }
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { render :new }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end


    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params

      params.require(:line_item).permit(:product_id)
    end

end
