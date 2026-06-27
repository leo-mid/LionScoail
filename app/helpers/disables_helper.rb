module DisablesHelper
  def postDisableCheck
    if Disable.first&.postdisable == true
      if user_signed_in?
        unless current_user.role == "admin"
          redirect_to root_path, notice: "Posts have been temporary disabled for a while till the problem has been fixed. - Have a nice day! 😁"
        end
      end
    end
  end

  def messagingDisableCheck
    if Disable.first&.conversationdisable == true
      if user_signed_in?
        unless current_user.role == "admin"
          redirect_to root_path, notice: "Messaging has been temporary disabled for a while till the problem has been fixed. - Have a nice day! 😁"
        end
      end
    end
  end

  def aboutDisableCheck
    if Disable.first&.about == true
      if user_signed_in?
        unless current_user.role == "admin"
          redirect_to root_path, notice: "The about page has been temporary disabled for a while till the problem has been fixed. - Have a nice day! 😁"
        end
      end
    end
  end

  def lionsocialDisableCheck
    if Disable.first&.lionsocial == true
      if user_signed_in?
        unless current_user.role == "admin"
          unless controller_name == "disables"
            redirect_to lionsocial_path
          end
        end
      end
    end
  end

  def lionnavDisabeCheck
    if Disable.first&.homedisable == true
      if user_signed_in?
        unless current_user.role == "admin"
          unless controller_name == "disables"
            redirect_to lionnav_path
          end
        end
      end
    end
  end
end
