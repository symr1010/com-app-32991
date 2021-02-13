class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to guide_path(@message.guide)
    else
      @guide = @message.guide
      @messages = @guide.messages
      render 'guides/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, guide_id: params[:guide_id])
  end
end
