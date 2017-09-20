class UsersController < ApplicationController
  def show
    render :layout => 'mailer'
  end
  def mainPage
  end
  def eventCreate
    render :layout => 'eventCreate'
  end
end
