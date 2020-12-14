class ParlamentariansController < ApplicationController
  before_action :set_parlamentarian, only: [:show, :edit, :update, :destroy]

  # GET /parlamentarians
  # GET /parlamentarians.json
  def index
    @parlamentarians = Parlamentarian.all
  end

  # GET /parlamentarians/1
  # GET /parlamentarians/1.json
  def show
  end

  # GET /parlamentarians/new
  def new
    @parlamentarian = Parlamentarian.new
  end

  # GET /parlamentarians/1/edit
  def edit
  end

  # POST /parlamentarians
  # POST /parlamentarians.json
  def create
    @parlamentarian = Parlamentarian.new(parlamentarian_params)

    respond_to do |format|
      if @parlamentarian.save
        format.html { redirect_to @parlamentarian, notice: 'Parlamentarian was successfully created.' }
        format.json { render :show, status: :created, location: @parlamentarian }
      else
        format.html { render :new }
        format.json { render json: @parlamentarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parlamentarians/1
  # PATCH/PUT /parlamentarians/1.json
  def update
    respond_to do |format|
      if @parlamentarian.update(parlamentarian_params)
        format.html { redirect_to @parlamentarian, notice: 'Parlamentarian was successfully updated.' }
        format.json { render :show, status: :ok, location: @parlamentarian }
      else
        format.html { render :edit }
        format.json { render json: @parlamentarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parlamentarians/1
  # DELETE /parlamentarians/1.json
  def destroy
    @parlamentarian.destroy
    respond_to do |format|
      format.html { redirect_to parlamentarians_url, notice: 'Parlamentarian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parlamentarian
    @parlamentarian = Parlamentarian.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parlamentarian_params
    params.require(:parlamentarian).permit(:name, :id_register, :num_portfolio, :num_legislature, :uf, :political_party, :cod_legislature)
  end
end
