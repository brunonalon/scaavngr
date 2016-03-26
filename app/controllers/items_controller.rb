class ItemsController < ApplicationController
  respond_to :json, :html
  def index
   if current_user
     if params[:filter] == '1'
       @item = item_filter(Item.where('user_id <> ? ', current_user.id), params[:current_item_id])
       puts "@items value >>>>>>>>>>>"
       puts @item.inspect
       puts "<<<<<<<<<<<<<"
     elsif params[:filter] == '2'
       @item = item_filter(current_user.get_nearby_items(params[:distance]), params[:current_item_id])
     end
     respond_with(@item)
   else
     redirect_to root_url
   end
 end
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to :back
    end
  end
  def show
    redirect_to items_path
  end
  def item_params
    params.require(:item).permit(:name, :picture_url, :description, :user_id, :remote_picture_url_url)
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to :action => 'index'
  end
end
