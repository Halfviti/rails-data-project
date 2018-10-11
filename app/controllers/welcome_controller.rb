class WelcomeController < ApplicationController
  def index
    @films = Film.all.order(:episode_id)
    @characters = Character.limit(9).order("RANDOM()")
  end
end
