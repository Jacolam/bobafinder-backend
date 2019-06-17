class StoresController < ApplicationController

  def index
    @all = Store.all.map do |store|
      hash = store.attributes
      user_store = UserStore.find_by(user_id: current_user.id , store_id: store.id)
      hash[:visited] = user_store ? user_store.visited : false
      hash[:favorite] = user_store ? user_store.favorite : false
      hash  
    end
    render json: {stores:@all}
  end

end
