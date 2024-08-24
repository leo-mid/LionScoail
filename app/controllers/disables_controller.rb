class DisablesController < ApplicationController
  before_action :set_disable, only: [:create, :update, :edit]
  before_action :check_admin, only: [:new, :edit]

  def new
    @disable = Disable.new
  end

  def create
    @disable = Disable.new(disable_params)
    if @disable.save
      flash[:notice] = "Disable feature was successfully created"
      redirect_to disables_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @disable.update(disable_params)
     flash[:notice] = "Disable feature was updated"
     redirect_to disables_path
    else
     flash[:notice] = "Disable feature was not updated"
     render 'edit'
    end
  end

  def index
  end

  def lionnav
  end

  def lionsocial
  end

  def change
    @disables = Disable.all
  end

  private

    def set_disable
      @disable = Disable.find(params[:id])
    end

  private
    def disable_params
      params.require(:disable).permit(:homedisable, :postdisable, :conversationdisable, :userdisable)
    end
end
