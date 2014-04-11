class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
  end

  def create
  end

  def show
    @transaction = Transaction.find(params[:id])
  end


private
  def transaction_params
  end

end
