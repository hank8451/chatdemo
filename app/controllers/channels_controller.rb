class ChannelsController < ApplicationController
  def new
    @channel = Channel.new
  end

  def create
    @channel = current_user.channels.new(channel_params)
    if @channel.save
      redirect_to channel_path(@channel.id), notice: "創立成功"
    else
      render :new
    end
  end

  def show
    @channel = Channel.find(params[:id])
    @message = Message.new
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end
