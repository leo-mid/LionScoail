module ApplicationHelper
  include DisablesHelper
  include UsersHelper
  include ConversationsHelper
  include PostsHelper

  def check_admin
    if user_signed_in?
      if current_user.role == "admin"
      else
        redirect_to root_path, notice: "You do not have access to this"
      end
    else
      redirect_to root_path, notice: "You do not have access to this"
    end
  end

  # User online?
  def online_status(user)
    content_tag :span, user.username,
                class: "user-#{user.id} online_status #{'online' if user.online?}"
  end

  def check_convo_user
    if @conversation.sender_id == current_user.id or @conversation.receiver_id == current_user.id
    else
      if current_user.role == "admin"
      else
        redirect_to root_path, notice: "You do not have access to this"
      end
    end
  end

  def timeago(time)
    content_tag(:span, time.iso8601, title: time.iso8601, class: 'timeago')
  end

end
