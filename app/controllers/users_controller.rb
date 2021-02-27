class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = user.name
    @position = user.position
    @profile = user.profile
    @occupation = user.occupation
    @prototypes = user.prototypes
  end
end
