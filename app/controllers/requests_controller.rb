class RequestsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@request = current_user.requests.build(request_params)

  	respond_to do |format|
      if @request.save
    		format.html { redirect_to root_url, notice: "Request created!" }
    	else
        @feed_items = []
        format.html { redirect_to root_url, notice: "Error creating request" }
    	end
      format.js
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Request deleted" }
      format.js
    end
  end

  private

    def request_params
    	params.require(:request).permit(:content, :private)
    end

    def correct_user
      @request = current_user.requests.find_by(id: params[:id])
      redirect_to root_url if @request.nil?
    end
end