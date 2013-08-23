class StaticPagesController < ApplicationController
  def home
  	if signed_in?
    	@request = current_user.requests.build
    	@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact
  end
end
