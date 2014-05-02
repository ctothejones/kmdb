class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end
end
