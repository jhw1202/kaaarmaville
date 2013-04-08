class UsersController < ApplicationController
  def index
    @users = User.order('total_karma DESC').limit(50)
  end
end
