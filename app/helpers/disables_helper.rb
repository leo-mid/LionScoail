module DisablesHelper
  def postdisable_check
    if Disable.first.postdisable == "yes"
      redirect_to disables_path
    else
    end
  end

  def conversationdisable_check
    if Disable.first.conversationdisable == "yes"
      redirect_to disables_path
    else
    end
  end

  def sitedisable_check
    if Disable.first.homedisable == "yes"
      if user_signed_in?
        if current_user.role == "admin"
        else
          redirect_to lionnav_path
        end
      else
        redirect_to lionnav_path
      end
    end
  end

  def userdisable_check
    if Disable.first.userdisable == "yes"
      redirect_to disables_path
    else
    end
  end

  def errordisable_check
    if Disable.first.error == "yes"
      redirect_to disables_path
    else
    end
  end

  def aboutdisable_check
    if Disable.first.about == "yes"
      redirect_to disables_path
    else
    end
  end

  def lionsocialdisable_check
    if Disable.first.lionsocial == "yes"
      redirect_to lionsocial_path
    else
    end
  end

end
