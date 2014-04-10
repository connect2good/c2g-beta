class MerchandiseController < ApplicationController
  def index
    @merchandise = Merchandise.all
  end
end
