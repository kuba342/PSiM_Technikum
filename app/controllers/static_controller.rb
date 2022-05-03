class StaticController < ApplicationController
  def index
    @animal_types = AnimalType.all
    @animals = Animal.all
    @users = User.all
  end
end
