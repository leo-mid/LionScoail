class AllMailer < ApplicationMailer
  def error_email
    @url = errors_url
    mail(to: User.all.find_by_role('admin').email, subject: 'A new error was found by a user.')
  end

  def welcome(resource)
    @resource = resource
    @user = @resource.username
    mail to: @resource.email
  end

  def change(user)
    @person = user
    @user = @person.username

    mail to: @person.email
  end
end
