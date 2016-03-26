class LikesController < ApplicationController
  respond_to :json, :html


  def create
    @like = Like.new({item_offered_id: params['item_offered_id'], item_liked_id: params['item_liked_id']})
    if @like.save
      render json: @like.check_matches
    end
  end

  def show
    redirect_to items_path
  end

  def like_params
    params.require(:like).permit(:item_offered_id, :item_liked_id)
  end
end
