class LoansController < ApplicationController
  # load_and_authorize_resource
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  def total_cost
  end

  # GET /loans/new
  def new
    @listing = Listing.find(params[:id])
    @brand = Brand.find(Listing.find(params[:id]).brand_id)
    @category = Category.find(Listing.find(params[:id]).category_id)
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
    @loan = Loan.find(params[:id])
    @listing = Listing.find(@loan.listing_id)
    @brand = Brand.find(@listing.brand_id)
    @category = Category.find(@listing.category_id)
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)
    @listing.renter_id = current_user.id
    # @loan.total_cost = @total_cost

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    @loan = Loan.new(loan_params)
    @listing = Listing.find(@loan.listing_id)
    @listing.renter_id = current_user.id
    # @loan.total_cost = @total_cost

    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(:listing_id, :start_date, :end_date, :total_cost, :listing_id)
    end
end
