class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1 or /invoices/1.json
  def show
    @products = Product.all
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @products = Product.all
  end

  # GET /invoices/1/edit
  def edit

    @products = Product.all

    @invoice.save_products
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = current_user.invoices.new(invoice_params)
    
   
    @invoice.save_products

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: "Factura Creada" }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        @invoice.save_products
        format.html { redirect_to @invoice, notice: "Invoice la factura ha sido actualizada." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:user_id, :nombre_cliente, :email_cliente, :total_factura, {product_elements: []})
    end
end
