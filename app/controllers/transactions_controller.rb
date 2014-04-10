class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
  end

  def create
  end

  def show
  end


private
  def transaction_params
  end

end
