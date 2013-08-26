class ContactController < ApplicationController
  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(params[:message])

  	if @message.valid?
  		NotificationsMailer.contact_us(@message).deliver
  		redirect_to root_url, notice: "Message successfully sent!"
  	else
  		flash.now.alert = "Please fill all fields."
  		render 'new'
  	end
  end
end
