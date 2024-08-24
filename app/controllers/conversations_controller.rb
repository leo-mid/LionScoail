class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :sitedisable_check
  before_action :lionsocialdisable_check
  before_action :conversationdisable_check

  def index
    @page_title = "Conversations Lion social"
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.update_attribute(:sender_id , "")
    @conversation.update_attribute(:receiver_id , "")
    @conversation.messages.destroy_all
    @conversation.delete
    redirect_to root_path, notice: 'Conversation was successfully deleted.'
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end
