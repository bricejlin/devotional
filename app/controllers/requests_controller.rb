class RequestsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@request = current_user.requests.build(request_params)
  	if @request.save
  		flash[:success] = "Request created!"
  		redirect_to root_url
  	else
      @feed_items = []
      flash[:notice] = "Error"
  		redirect_to root_url
  	end
  end

  def destroy
    @request.destroy
    redirect_to root_url
  end

  private

    def request_params
    	params.require(:request).permit(:content)
    end

    def correct_user
      @request = current_user.requests.find_by(id: params[:id])
      redirect_to root_url if @request.nil?
    end
end