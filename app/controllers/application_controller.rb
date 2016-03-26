class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  # def current_item
  #   @current_item_id ||= session[:current_item] if session[:user_id]
  # end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # def current_item
  #   params[:]
  #   # if(params.has_key?(:trade))
  #   #   session[:current_item] = params[:trade][:current_item]
  #   #   @current_item = Item.where("id = ?", params[:trade][:current_item])
  #   # end
  # end
  def item_filter(items, current_item)
    filtered = []
    puts "current_item >>>>>>>>>>"
    puts current_item
    puts "-----------------------"
    items.each do |item|
      resultDislike = Dislike.where("item_offered_id = ? and item_disliked_id = ?", current_item.to_i, item.id)
      resultLike = Like.where("item_offered_id = ? and item_liked_id = ?", current_item.to_i, item.id)
      puts "item: "
      puts item.inspect
      puts "result: "
      filtered << item if resultDislike.length  == 0 && resultLike.length == 0

    end
    puts "filtered >>>>>>>>>>>"
    puts filtered
    puts "<<<<<<<<<<<"
    filtered
  end

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end
  def ip_address
    "156.74.181.208"
  end
  def location
    if params[:location].blank?
      if Rails.env.production? || Rails.env.development?
        @location ||= Geocoder.search("156.74.181.208").first
      else
        @location ||= request.location
      end
    else
      params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
      @location ||= Geocoder.search(params[:location]).first
      @location
    end
  end
end
