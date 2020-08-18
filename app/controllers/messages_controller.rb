class MessagesController < ApplicationController
  before_action :find_channel, only: [:create]

  # def new
  #   @message = Message.new
  # end

  def create
    @message = @channel.messages.new(msg_params)
    # puts @message.channel_id
    # puts @channel
    # redirect_to root_path
    if @message.save
      # puts 123
      # redirect_to root_path
      ActionCable.server.broadcast "chatroom_channel_#{@channel.id}", message: "#{@message.content}"
    else
      # puts 456
      # redirect_to root_path
      # render
    end
  end

  def destroy
  end

  def edit
  end

  private

  def find_channel
    @channel = Channel.find_by(id: params[:channel_id])
  end

  def find_user
    @user = User.find()
  end

  def msg_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
