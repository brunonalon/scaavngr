class DislikesController < ApplicationController
  respond_to :json, :html

  def create
    @dislike = Dislike.new({item_offered_id: params['item_offered_id'], item_disliked_id: params['item_disliked_id']})
    if @dislike.save
      render json: @dislike
    end
  end
end
