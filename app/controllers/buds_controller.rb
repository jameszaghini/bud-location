class BudsController < ApplicationController
  before_action :set_bud, only: [:show, :edit, :update, :destroy]

  # GET /buds
  # GET /buds.json
  def index
    @buds = Bud.all
  end

  # GET /buds/1
  # GET /buds/1.json
  def show
  end

  # GET /buds/new
  def new
    @bud = Bud.new
  end

  # GET /buds/1/edit
  def edit
  end

  # POST /buds
  # POST /buds.json
  def create
    @bud = Bud.new(bud_params)

    respond_to do |format|
      if @bud.save
        format.html { redirect_to @bud, notice: 'Bud was successfully created.' }
        format.json { render :show, status: :created, location: @bud }
      else
        format.html { render :new }
        format.json { render json: @bud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buds/1
  # PATCH/PUT /buds/1.json
  def update
    respond_to do |format|
      if @bud.update(bud_params)
        format.html { redirect_to @bud, notice: 'Bud was successfully updated.' }
        format.json { render :show, status: :ok, location: @bud }
      else
        format.html { render :edit }
        format.json { render json: @bud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buds/1
  # DELETE /buds/1.json
  def destroy
    @bud.destroy
    respond_to do |format|
      format.html { redirect_to buds_url, notice: 'Bud was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bud
      @bud = Bud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bud_params
      params.require(:bud).permit(:identifier, :session_id, :uuid)
    end
end
