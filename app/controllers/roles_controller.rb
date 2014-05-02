class RolesController < ApplicationController
  def index
    @list_of_roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end
end
