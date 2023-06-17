class TransactionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_transaction, only: %i[destroy]

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  # POST /transactions or /transactions.json
  def create
    init_transaction_params = transaction_params.merge(status: :approved).reject { |k| k == 'type' }
    @transaction = Transaction.infer_type!(transaction_params[:type]).new(init_transaction_params)

    if @transaction.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:amount, :type, :customer_email, :customer_phone)
  end
end
