class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      # Git, logujemy
      log_in user
      redirect_to root_url
    else
      # nie jest git
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
