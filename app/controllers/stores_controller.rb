class StoresController < ApplicationController

  def index
    @all = Store.all
    render json: {stores:@all}
  end
end
