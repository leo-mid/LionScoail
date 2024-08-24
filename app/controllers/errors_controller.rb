class ErrorsController < ApplicationController
  before_action :set_error, only: [:destroy]
  before_action :check_admin, only: [:index, :destroy]
  before_action :authenticate_user!
  before_action :sitedisable_check
  before_action :lionsocialdisable_check
  before_action :errordisable_check

  def new
    @error = Error.new
  end

  def create
    @error = Error.new(error_params)
    @error.update_attribute(:site, "social")
    @error.update_attribute(:resolved, false)
    if @error.save
      flash[:notice] = "Error was successfully reported. We will review it and fix this error #{current_user.username}."
      redirect_to root_path
      AllMailer.error_email.deliver_now
    else
      render 'new'
    end
  end

 def index
   @page_title = "Errors Lion social"
   @errors = Error.all
   @errors = Error.by_newest
 end

 def destroy
   @error.destroy
   flash[:notice] = "Error was deleted"
   redirect_to errors_path
  end

 private
  def set_error
    @error = Error.find(params[:id])
  end

  def error_params
    params.require(:error).permit(:error, :description, :site, :resolved)
  end

end
