class StaticController < ApplicationController
  def index
    @animal_types = AnimalType.all
  end
end
